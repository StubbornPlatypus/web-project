package model;
public class Station
{
    private int id;
    private String name;
    private String image;
    private String map;
    private String description;

    public int getId()
    {
        return id;
    }

    public String getName()
    {
        return name;
    }

    public String getImage()
    {
        return image;
    }

    public String getMap()
    {
        return map;
    }
    
    public String getDescription()
    {
    	return this.description;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    public void setMap(String map)
    {
        this.map = map;
    }
    
    public void setDescription(String description)
    {
    	this.description = description;
    }
}
