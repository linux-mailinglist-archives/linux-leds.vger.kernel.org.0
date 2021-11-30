Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F4C4641A3
	for <lists+linux-leds@lfdr.de>; Tue, 30 Nov 2021 23:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345037AbhK3Wok (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Nov 2021 17:44:40 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39661 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236654AbhK3WoE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Nov 2021 17:44:04 -0500
Received: by mail-ot1-f42.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso32323136ots.6;
        Tue, 30 Nov 2021 14:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2neI0tSUgaH4gBDXgfQXS8SaEeaSPmkM7rMYMUj4LwI=;
        b=6U/8biUGQa6jH1XmxYSdlITr/TzvRNEG8SauTvpSI053T4Pr67O3F+jun8o2G3HG46
         EmpQo8KzqCSoBkKHygdif8FuWcBGA0csBJcVv0PY8dBxYElDO501yUgmCx51u1uVvOYn
         QMF56qOQMH0IvfYfQ+JPr9X7MOe32CL9dtrxI6puHzaiVn4RSg952JHFmVBlZL4qi/g4
         UkDc36vB9v8OPTQbTarjF84h+VEEBveqWdBYQKA3qQ9pBHx74Fye4Ueqeghc0XZAimW/
         BFe/enfZ2+eW6v3SXsnTkNIeAXVr7Gm3/f7/n+Im1rTcP4Gp9XY3gfDe2TUbnrESJ1wq
         PE+g==
X-Gm-Message-State: AOAM531sf9wYU3oCSZgo65KbfxCRo7Z5Yl6Lo71qdskqHE5XgnTUEtQ/
        Sbjmj1KdGrjk0AS8J1PTjazbowxS6Q==
X-Google-Smtp-Source: ABdhPJxFEQXA8WQceL+bGLgO2h89ED+skOXRZd+IRcPvheFczsOk+DcEMiy0XHkvEC23oppTn0GPqw==
X-Received: by 2002:a05:6830:2683:: with SMTP id l3mr2100482otu.258.1638312044412;
        Tue, 30 Nov 2021 14:40:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e26sm175589oog.46.2021.11.30.14.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:40:43 -0800 (PST)
Received: (nullmailer pid 3142512 invoked by uid 1000);
        Tue, 30 Nov 2021 22:40:42 -0000
Date:   Tue, 30 Nov 2021 16:40:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     devicetree@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
Message-ID: <Yaaoan2BnAh6ayak@robh.at.kernel.org>
References: <20211124111952.22419-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124111952.22419-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 24 Nov 2021 12:19:51 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
> 
> The newer one was also later also used on BCM4908 SoC.
> 
> Old block is already documented in the leds-bcm6328.yaml. This binding
> documents the new one which uses different registers & programming. It's
> first used in BCM63138 thus the binding name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Rename to bcm63138 & make "brcm,bcm63138-leds" the main compatible
> ---
>  .../bindings/leds/leds-bcm63138.yaml          | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
