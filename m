Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691962A8665
	for <lists+linux-leds@lfdr.de>; Thu,  5 Nov 2020 19:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKESs6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Nov 2020 13:48:58 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40113 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgKESs6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Nov 2020 13:48:58 -0500
Received: by mail-ot1-f68.google.com with SMTP id 79so2386283otc.7;
        Thu, 05 Nov 2020 10:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kCbG7E0XHBwO7XlEyC5EZYYga3b3NzADkcQOrZiRfRI=;
        b=FKg0uGLMDR0TQEIRVcjkutECVm7DGbQAAMwlgiaPgzJu3p+rdncEj/0sJb5F9aBf/C
         HCda64oVteXvP3v3rw4PN+MHlETXBt3su05RbBSmo1TLMlfwaIi38u6ZXlDAU4+O7dej
         tSS0994bBmlaFgJi87FcAd8kb8kAfd2OD4DHCSDeMiGKg8XHnH3wtnzqzO7LNMVS16Ya
         /oxugZrkU2ONP8goPmp726r8LGqik3RfXimGdk8j1n7vsmsafGhaoAsMyJ2CQFhV6fTt
         3zr1PW9uRfdsmMNqQeC21rqYdT5GIgwJX+anx3VOzbBnkyutho3cAJyJJqrERgzsApVb
         /fDg==
X-Gm-Message-State: AOAM530oNhNXj6gbXI5N4P+L+Hoyx8JoJnd4hNgFw1IuxcGeht4hC5/C
        JWnN9OWvdRS+COkBNfsJ8Q==
X-Google-Smtp-Source: ABdhPJxFPwLW0bZMkojwYhyhhzC53CrQs4WQrvax050FzKnpQZxnL4bBIyvSxktijzoUe3BwhZNdJQ==
X-Received: by 2002:a9d:550c:: with SMTP id l12mr2641433oth.91.1604602136863;
        Thu, 05 Nov 2020 10:48:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm537635ooy.36.2020.11.05.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:48:56 -0800 (PST)
Received: (nullmailer pid 1621199 invoked by uid 1000);
        Thu, 05 Nov 2020 18:48:55 -0000
Date:   Thu, 5 Nov 2020 12:48:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     dmurphy@ti.com, yixin.zhu@intel.com, linux-leds@vger.kernel.org,
        pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org,
        malliamireddy009@gmail.com, linux-kernel@vger.kernel.org,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: leds: Add bindings for intel LGM SOC
Message-ID: <20201105184855.GB1620536@bogus>
References: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 05 Nov 2020 17:43:50 +0800, Amireddy Mallikarjuna reddy wrote:
> Add DT bindings YAML schema for SSO controller driver
> of Lightning Mountain(LGM) SoC.
> 
> Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> ---
>  .../devicetree/bindings/leds/leds-lgm.yaml         | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:14:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:18:3: [warning] wrong indentation: expected 3 but found 2 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:21:3: [warning] wrong indentation: expected 3 but found 2 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:29:3: [warning] wrong indentation: expected 3 but found 2 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:34:3: [warning] wrong indentation: expected 3 but found 2 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:40:3: [warning] wrong indentation: expected 3 but found 2 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:45:5: [warning] wrong indentation: expected 3 but found 4 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:47:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:57:16: [warning] wrong indentation: expected 14 but found 15 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:78:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/leds/leds-lgm.yaml:87:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-lgm.example.dt.yaml: ssogpio@E0D40000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-lgm.yaml


See https://patchwork.ozlabs.org/patch/1394849

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

