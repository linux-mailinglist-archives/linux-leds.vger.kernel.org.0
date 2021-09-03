Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7F44002B3
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 17:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349793AbhICP5Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 11:57:16 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:44809 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349788AbhICP5P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 11:57:15 -0400
Received: by mail-ot1-f48.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so7034100otg.11;
        Fri, 03 Sep 2021 08:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Qw1bAMElDkYxGWDBqnwHtgJcwFZ+rm2etjwEK2p/4FE=;
        b=lPaXPnnEOYzIdc/IfxBYDqiKsxMMMEZjLF3gsYkgX5gWJg4FIk6tbSDDd+wZQdaDml
         4GEbMkjjP8wbnX3eZk1r+gVMno86Toyt2RHnQY9iTAh9M8xsuVB1Bqo30u9lamDuL8FI
         m1SQvxB2PYCvD/iNjr9+Rsj9k8WOouD3S+cHDB1NPNwCxc3dS2XFnsyLPXzn9sJfsq7H
         Rt0u+tsYV4ELQcG9UTR7lPiuGoQ6TYsWcW8vJtG9JGGamsihlWt83N7absCu9dFGUTGd
         vlMQ6bfaG1znOPCoD24wo9kEQmT93g0m2rZ7oNsIOnoUVKkWRGGqRvd1hdGNtNZwz0gN
         WAyg==
X-Gm-Message-State: AOAM533u3Xom6OkrW3kiAggMX6TvcITxdRzsCn6/D7YSiWvggosrSyjj
        R144bUHNIHVM9bbyKwQSTJC2BVMc5g==
X-Google-Smtp-Source: ABdhPJyAMzmsbFER7typFkPmoLeoFJ2qnfJ2IG5LxBRRPRujgg0zeim5BgpDaIjgj5gWlPBji7nqUw==
X-Received: by 2002:a9d:1c97:: with SMTP id l23mr3638349ota.230.1630684573465;
        Fri, 03 Sep 2021 08:56:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r31sm1043893otv.45.2021.09.03.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 08:56:12 -0700 (PDT)
Received: (nullmailer pid 3010407 invoked by uid 1000);
        Fri, 03 Sep 2021 15:56:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi@lists.linux.dev
In-Reply-To: <20210902234228.32223-1-samuel@sholland.org>
References: <20210902234228.32223-1-samuel@sholland.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED controller
Date:   Fri, 03 Sep 2021 10:56:11 -0500
Message-Id: <1630684571.592582.3010406.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 02 Sep 2021 18:42:27 -0500, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../leds/allwinner,sun50i-r329-ledc.yaml      | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml:83:3: [error] duplication of key "t1h-ns" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 17, column 3
found duplicate key "t1h-ns" with value "{}" (original value: "{}")
  in "<unicode string>", line 83, column 3

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.example.dts] Error 1
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 623, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 17, column 3
found duplicate key "t1h-ns" with value "{}" (original value: "{}")
  in "<unicode string>", line 83, column 3

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1523964

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

