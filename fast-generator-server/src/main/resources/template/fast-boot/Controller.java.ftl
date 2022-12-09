package ${package}<#if moduleName??>.${moduleName}</#if>.controller<#if subModuleName??>.${subModuleName}</#if>;



import javax.validation.Valid;
import java.util.List;

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Slf4j
@RestController
@RequestMapping("<#if moduleName??>${moduleName}/</#if>${classname}")
@Api(tags = "${tableComment}")
public class ${ClassName}Controller {
    @Resource
    private  ${ClassName}Manager ${className}Manager;

    @PostMapping(value = "/pageQuery")
    @ApiOperation(value = "分页查询")
    public Result<PageResult<${ClassName}DTO>> pageQuery(@Valid ${ClassName}Query query){
        return Result.success(${className}Manager.pageQuery(query));
    }

    @GetMapping("/queryByID")
    @ApiOperation(value = "根据ID查询详细信息")
    public Result<${ClassName}DTO> queryByID(@RequestParam Long id){
        return Result.success(${className}Manager.queryByID(id));
    }

    @PostMapping("/create")
    @ApiOperation(value = "新建")
    public Result<Long> save(@RequestBody ${ClassName}DTO ${className}DTO){
        return Result.success(${className}Manager.create(${className}DTO));
    }

    @PostMapping("/update")
    @ApiOperation(value = "编辑")
    public Result<Long> update(@RequestBody @Valid ${ClassName}DTO ${className}DTO){
        return Result.success( ${className}Manager.update(${className}DTO));
    }

    @ApiOperation(value = "禁用")
      @PostMapping("/disable")
      public Result disable(@RequestParam Long id){
          return Result.success(${className}Manager.disable(id));
      }

      @ApiOperation(value = "启用")
      @PostMapping("/enable")
      public Result enable(@RequestParam Long id){
          return Result.success( ${className}Manager.enable(id));
      }

}