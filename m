Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB80D526BD0
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 22:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384535AbiEMUsl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 16:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384536AbiEMUsl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 16:48:41 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CD832055;
        Fri, 13 May 2022 13:48:37 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-f165bc447fso2079233fac.6;
        Fri, 13 May 2022 13:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=G0HRg/eMV0gjRbcJBeb68HSPQA7CA9r4uKxoOvM1BNM=;
        b=1gWsZTMqLsnzQONrTciIsvelM0RK6VXWESOLW+1AWFepgVcLy85HFKC3ujSJspl22/
         tdiAcRuKB7qHTByvzm3NUR7Idz9EdlYxWGAFcNEitMUM6I8Z43pWDIg+lqPvORgq8GOA
         Ox9Zxd9MFLhqJeZZXw4uu3EQYKhHa9Z1FCj1Q/dR4udghpc1w7YNcy9ZgzZi4iaYC92K
         GFy8y4KBfnTUiI/4cyBohFrI7BA8FCV1IfnskR3Fiv/3Z2ulWoQrVgiYAJ9kPL+UKHEb
         XtxRopr6tfVLKG7BIuyDD6tImaeKZAMh9h7hTa42sKxShL5CsdCV+2eCfA2znrBDjwfz
         xNSw==
X-Gm-Message-State: AOAM531HmckoM6JvLgUOJoR8KVta1jLLck5Vr8zgtg1k43Yz4z1FNh60
        W/ufmCwqXQmVZctEzLwj6O9GCxmP0A==
X-Google-Smtp-Source: ABdhPJzrHwwmFJjSuzGpZXJQRdwqxNNINpFfojz7/rMwOzMwAnRNIGBr15rvMJWKrJ7DAPwovWMZbw==
X-Received: by 2002:a05:6870:390c:b0:ec:76fb:93c5 with SMTP id b12-20020a056870390c00b000ec76fb93c5mr3632268oap.64.1652474917120;
        Fri, 13 May 2022 13:48:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 9-20020aca1209000000b00325cda1ff8esm1427846ois.13.2022.05.13.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 13:48:36 -0700 (PDT)
Received: (nullmailer pid 894562 invoked by uid 1000);
        Fri, 13 May 2022 20:48:33 -0000
From:   Rob Herring <robh@kernel.org>
To:     Kyle Swenson <kyle.swenson@est.tech>
Cc:     krzk+dt@kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz,
        devicetree@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20220513190409.3682501-2-kyle.swenson@est.tech>
References: <20220513190409.3682501-1-kyle.swenson@est.tech> <20220513190409.3682501-2-kyle.swenson@est.tech>
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add aw21024 binding
Date:   Fri, 13 May 2022 15:48:33 -0500
Message-Id: <1652474913.775070.894561.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 13 May 2022 13:04:09 -0600, Kyle Swenson wrote:
> Add device-tree bindings for Awinic's aw21024 24 channel RGB LED Driver.
> 
> Datasheet:
> https://www.awinic.com/Public/Uploads/uploadfile/files/20200511/20200511165751_5eb9138fcd9e3.PDF
> 
> Signed-off-by: Kyle Swenson <kyle.swenson@est.tech>
> ---
>  .../bindings/leds/leds-aw21024.yaml           | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-aw21024.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-aw21024.yaml:54:1: [error] duplication of key "patternProperties" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/leds/leds-aw21024.example.dts'
Documentation/devicetree/bindings/leds/leds-aw21024.yaml: found duplicate key "patternProperties" with value "{}" (original value: "{}")
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/leds/leds-aw21024.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.10/dist-packages/dtschema/lib.py", line 914, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 121, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 131, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 674, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 445, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 263, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 294, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "patternProperties" with value "{}" (original value: "{}")
  in "<unicode string>", line 54, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 74, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-aw21024.yaml: ignoring, error parsing file
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

