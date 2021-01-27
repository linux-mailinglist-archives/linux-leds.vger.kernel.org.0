Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5DD305DC2
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 15:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhA0OCR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Jan 2021 09:02:17 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43068 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbhA0OBB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Jan 2021 09:01:01 -0500
Received: by mail-oi1-f172.google.com with SMTP id i25so2177681oie.10;
        Wed, 27 Jan 2021 06:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Hk3zfjFe35sbucjkkXwLkWfsMmYdk7hwJLDIIv4M2H8=;
        b=VHT80QNUNLJuRY4uyrrtKnzEew+/u6n1ux931o3numRqUkiB2nWZPfFltctoolAs1f
         32+Nrp+kctRGjIaCdv/5MXI4uyrItDhjh+XOmZo5cuz2tkuW5uZtgOFcWlde/nq956B5
         6cP68Q0fIWJaUu7JphgXfSejPENd9Saqa4J1J0uIXAIhnMzueIw7y02kyu8eaQNsBpuA
         ZpathD9mGT9NoY8Nkdk/iDaLEitT7gOZxvHg8wLn6FXcthPZFiQL8VxfqgHz0+CNqHnH
         mGW2vItEfKiwFl0rqBpJZ86nlA+gPb06a0krI5LsJ7OSy9wWlWF+x3+ByoWDHpM7dl5q
         lAEg==
X-Gm-Message-State: AOAM532Exm4GAoJ3qznXO81OVVacAj9UmmZNArK4voPEn/gkUues0mUY
        YxaZsvD4AS9OsqiT0QZzjg==
X-Google-Smtp-Source: ABdhPJz4CHBJ4UvRditVqnhKW1z+Md2lGKVf1vYf6KX9zfQ8jhAbIwY6/hFRB1FEB42VGacvlO/WOw==
X-Received: by 2002:a05:6808:57d:: with SMTP id j29mr3340540oig.146.1611756019662;
        Wed, 27 Jan 2021 06:00:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x197sm458043ooa.27.2021.01.27.06.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:00:18 -0800 (PST)
Received: (nullmailer pid 1429688 invoked by uid 1000);
        Wed, 27 Jan 2021 14:00:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        lkcamp@lists.libreplanetbr.org, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, andrealmeid@collabora.com,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Brian Masney <masneyb@onstation.org>,
        Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20210126140240.1517044-2-nfraprado@protonmail.com>
References: <20210126140240.1517044-1-nfraprado@protonmail.com> <20210126140240.1517044-2-nfraprado@protonmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Add binding for qcom-spmi-flash
Date:   Wed, 27 Jan 2021 08:00:11 -0600
Message-Id: <1611756011.217281.1429687.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 26 Jan 2021 14:04:08 +0000, Nícolas F. R. A. Prado wrote:
> Add devicetree binding for QCOM SPMI Flash LEDs, which are part of
> PM8941, and are used both as lantern and camera flash.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> Changes in v2:
> - Add this commit
> 
>  .../bindings/leds/leds-qcom-spmi-flash.yaml   | 94 +++++++++++++++++++
>  .../dt-bindings/leds/leds-qcom-spmi-flash.h   | 15 +++
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
>  create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,startup-dly: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maximum', '$ref', 'minimum' were unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,startup-dly: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	'/schemas/types.yaml#definitions/uint32' does not match 'types.yaml#/definitions/'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,clamp-curr: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('$ref' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,clamp-curr: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	'/schemas/types.yaml#definitions/uint32' does not match 'types.yaml#/definitions/'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,headroom: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('maximum', '$ref', 'minimum' were unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: patternProperties:^led[0-1]$:properties:qcom,headroom: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	'/schemas/types.yaml#definitions/uint32' does not match 'types.yaml#/definitions/'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml: ignoring, error in schema: patternProperties: ^led[0-1]$: properties: qcom,startup-dly
warning: no schema found in file: ./Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml

See https://patchwork.ozlabs.org/patch/1431711

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

