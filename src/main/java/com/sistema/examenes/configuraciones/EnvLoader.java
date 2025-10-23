package com.sistema.examenes.configuraciones;

import io.github.cdimascio.dotenv.Dotenv;
import io.github.cdimascio.dotenv.DotenvException;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EnvLoader {

    static {
        try {
            // Intentar cargar .env local
            Dotenv dotenv = Dotenv.load();
            dotenv.entries().forEach(entry ->
                    System.setProperty(entry.getKey(), entry.getValue())
            );
            System.out.println("Variables cargadas desde .env");
        } catch (DotenvException e) {
            // En producción (Render), usar variables de entorno del sistema
            System.out.println("No se encontró .env, usando System.getenv()");
        }
    }
}
