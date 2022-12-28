Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9EC658535
	for <lists+linux-leds@lfdr.de>; Wed, 28 Dec 2022 18:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbiL1RQt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Dec 2022 12:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiL1RQs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Dec 2022 12:16:48 -0500
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303A6B87E;
        Wed, 28 Dec 2022 09:16:48 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id v2so8551939ioe.4;
        Wed, 28 Dec 2022 09:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IAxtbIjriD6ONwdPLqIgULK51ZHC86VahE1xpOZPmSI=;
        b=LadUh6JCQYI5dI0jPs4du3V7H0A3Qvqkj0DeL/v9st0K0+VkOBKktuZlsIB9HUV7WH
         0jjsY54xBhqBBkNOOPYfFC5lBgeV3DpWYu0i1GAImsnPeOomvgNg2gdbyWNmRo/E1Hsh
         QvfaxzCJLtj0sB5eojEjNzPp6W7oyrUcBTIH5NO1VoDtrryD37QRwKg97b3vm8qslPr7
         xPDpKOJrikl/83SUyCMazCytsLRqiemUEENRzMgPyFUXojOM1MBzZDkITfak8WCS4NLJ
         OvhhBaoPcwq9FNFckmNco+1OvcNTt4z/sWeNLQ69Rm5ancptt+rdly7bTBSUlVjSkIKK
         jQLw==
X-Gm-Message-State: AFqh2kqveAmEZh8xVYJqgTyAj+mC6B38UU9xPAy/Y1tWNT4QQbzNYKe3
        GXXTKyA3B+c5sHTqAAgD1w==
X-Google-Smtp-Source: AMrXdXs+PXKY23LAYHFN8chqO+iSLvW7AVJIfuXB65d4McqxSUfkscL3Ad9LGN+g8pRcaRjGt0Csxw==
X-Received: by 2002:a5e:9e0d:0:b0:6df:dc79:a1f2 with SMTP id i13-20020a5e9e0d000000b006dfdc79a1f2mr16730260ioq.11.1672247807344;
        Wed, 28 Dec 2022 09:16:47 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x9-20020a026f09000000b00375217ea9b6sm5210025jab.45.2022.12.28.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 09:16:46 -0800 (PST)
Received: (nullmailer pid 1928465 invoked by uid 1000);
        Wed, 28 Dec 2022 17:16:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Wadim Egorov <w.egorov@phytec.de>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org, pavel@ucw.cz,
        linux-leds@vger.kernel.org, lee@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, upstream@lists.phytec.de,
        jacek.anaszewski@gmail.com
In-Reply-To: <20221228140449.938513-1-w.egorov@phytec.de>
References: <20221228140449.938513-1-w.egorov@phytec.de>
Message-Id: <167224754074.1921630.2667864472340880362.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: leds: Convert PCA9532 to dtschema
Date:   Wed, 28 Dec 2022 11:16:44 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On Wed, 28 Dec 2022 15:04:49 +0100, Wadim Egorov wrote:
> Convert the PCA9532 LED dimmer to dtschema.
> While at it, also update and the the example to match
> recommended node names and the link to the product datasheet.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt | 49 -----------
>  .../bindings/leds/leds-pca9532.yaml           | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/leds/leds-pca9532.example.dts:28.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/leds/leds-pca9532.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221228140449.938513-1-w.egorov@phytec.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

