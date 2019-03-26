//
//  Contato.m
//  ContatosIP67v2
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *)description {
    return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, Endereço: %@, Site: %@, Latitude: %@, Longitude: %@", self.nome, self.telefone, self.endereco, self.site, self.latitude, self.longitude];
}

@end
