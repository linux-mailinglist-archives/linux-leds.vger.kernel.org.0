Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BAD28606E
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 15:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgJGNun (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 09:50:43 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44180 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNun (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Oct 2020 09:50:43 -0400
Received: by mail-oi1-f193.google.com with SMTP id x62so2436082oix.11;
        Wed, 07 Oct 2020 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tHjfssJN4xtGC2v26gavuA3JBazoT19809Dqj28cIXc=;
        b=YTw11Z7jywMgODubZ9K6RH5T5jx78hdihDAiAMpQno2zjcbHLMOfGLH8GHqYf27SQv
         AIcGmV0sX+67HU6fRyaP3nyR5SN85ZzJ1ZRSgmqaqFs/Z7rGwguLtWVYmfqkfllBoLOA
         t+RRHCZFP8S6ER9fL6E4l5yTrVj55dPS9PTvGHGbqH+4rJJ+cQ5S8sa4MjvNKVFvAxk8
         LtpwB6WTzypO3d82CyvZUDhbGQ5fanv283UdIzRGFlS2D5uAIlT3Os8go9QLS3Pi0eYT
         wloMc+hPUOWiqzP03OOlfY49bcf31dTeDKVhLbq1dbaBxhjU7BY9fV9aEM1POIEK95Yg
         eQbg==
X-Gm-Message-State: AOAM533wb+Qb4M2atPOQ24ztG7u+0xiblxonAY6z9fJawBxj88PkoPmo
        918ggj63Nzpj9QIkX1jwFg==
X-Google-Smtp-Source: ABdhPJwItZ2iHWEIWP2OBnOgPnQrGMhJQqTy5o/IN8sbPTbtIrR7N7hUK9M/gtjrMkQrM7fyqIDCTg==
X-Received: by 2002:aca:53d7:: with SMTP id h206mr1990127oib.113.1602078641716;
        Wed, 07 Oct 2020 06:50:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h3sm2260548oom.18.2020.10.07.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:50:40 -0700 (PDT)
Received: (nullmailer pid 123982 invoked by uid 1000);
        Wed, 07 Oct 2020 13:50:39 -0000
Date:   Wed, 7 Oct 2020 08:50:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     robh+dt@kernel.org, shufan_lee@richtek.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org, gene_chen@richtek.com,
        matthias.bgg@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        benjamin.chao@mediatek.com, cy_huang@richtek.com, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Wilma.Wu@mediatek.com
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201007135039.GA123258@bogus>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 07 Oct 2020 09:42:45 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@0:color:0:0: 9 is greater than the maximum of 8
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml


See https://patchwork.ozlabs.org/patch/1377747

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

