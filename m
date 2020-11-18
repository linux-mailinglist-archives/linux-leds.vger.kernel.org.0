Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB03F2B868F
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 22:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgKRVZI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 16:25:08 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40413 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgKRVZH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 16:25:07 -0500
Received: by mail-ot1-f66.google.com with SMTP id 79so3243264otc.7;
        Wed, 18 Nov 2020 13:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dVopaicN4WO5jX3qlzk9Gxh2dwImscYqoXqAMkTLGu8=;
        b=ODqRmlnLKel+0IKBv6szBVny7FPFyxaDE8VcgXdk5uD6om6TTrDQaHIK4aLeVsnHdD
         NPO1cC/trbWfZ7VNB49Ce4duwgOsPAEP6F7DjNrnKGnVqB9xYQ8EN4ADPkYVDF7+J+6g
         05r1sjjWM0+aCbo0hpu7VvhYL7u5z1fnOXTSVwgngc5K2E1rFLxBCzXRZRdKc6UgXk6I
         Cqh4RZ0b2IRUyo0p9TVp2EOSFRACynopSXXNssXKutY8OVT5Mvv2mU+2w7DBPiRc0NH7
         nykxDPmb2fLnJ+u0VzJee5AAUXr1LeYAAsNhDsoLp2DSTX/eq1kqM/TlSQdOdEcify5y
         Ep5Q==
X-Gm-Message-State: AOAM532LX2f+CyBkzqG4iyJQeu+tprGAR6whsozKksHJNbiWRYQg6mjd
        IXtDMjoZMiYKH2z+boVhBw==
X-Google-Smtp-Source: ABdhPJzm/kk2CPACpsVZE1AAcctyqN5LX33XhWeNW5D2M0R6egknc3RR1Hv9LjS+QA9Yq/JuNdaKHA==
X-Received: by 2002:a9d:3b43:: with SMTP id z61mr7747094otb.178.1605734704947;
        Wed, 18 Nov 2020 13:25:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j23sm7883400otr.80.2020.11.18.13.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:25:04 -0800 (PST)
Received: (nullmailer pid 1841192 invoked by uid 1000);
        Wed, 18 Nov 2020 21:25:02 -0000
Date:   Wed, 18 Nov 2020 15:25:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     devicetree@vger.kernel.org, cy_huang@richtek.com,
        robh+dt@kernel.org, pavel@ucw.cz, gene_chen@richtek.com,
        matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, dmurphy@ti.com,
        Wilma.Wu@mediatek.com, benjamin.chao@mediatek.com,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jacek.anaszewski@gmail.com, shufan_lee@richtek.com
Subject: Re: [PATCH v7 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201118212502.GA1839537@bogus>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 18 Nov 2020 18:47:41 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-mt6360.yaml:57:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greater than the maximum of 9
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greater than the maximum of 9
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml


See https://patchwork.ozlabs.org/patch/1402193

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

