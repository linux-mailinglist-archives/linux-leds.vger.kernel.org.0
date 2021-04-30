Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5D73701D5
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 22:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhD3ULq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 16:11:46 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:40859 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhD3ULp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Apr 2021 16:11:45 -0400
Received: by mail-oi1-f178.google.com with SMTP id u16so53879207oiu.7;
        Fri, 30 Apr 2021 13:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TQ39G9eWDsOl7sqJoYVutkae5eYvscnE8x+ZtLW1WuU=;
        b=hgc8kfa2usNSOdnv/tcQiXWOoM7U7MnumyfIXv56cICiV9M0Tb7/a+JAi/6sQVmSEv
         M2gnKOok8lqLFUJGe/iYFWiql+FTaH4MJRKIxZjd0J0ZdcT2nu+PChwWgTtGe6m7pUh8
         2RrMQhw4+lsU3Ew9/K22mF0dKHASRd1nfR6Egk4ANprxb83DuK9UzeKSUqkYHfnHi7x5
         aim1mA/0WPAfmOArfWowK/M6bPAJHyvf/4nqlA4A4Vykd1OhiS3737jiaoJsihYNjpx4
         oIjwj+Q/vkYKt9rgP+vvdSSz4+tNX+hrx9FAZ5Mx130pfJ8MxrDv/6hyGeMDX0hwOfUw
         VANQ==
X-Gm-Message-State: AOAM530HjEIUFohP6GLk8TnLNy5QhXoIAAiLfnFru0mAzhOL71hDSYlY
        1VHD8UoCeVGmMKQDIcS53A==
X-Google-Smtp-Source: ABdhPJyUY7X2RUi39DJ7DAkgG1ZZWRwUThEejPKruSWn2yZoGsiWv4NM6qjHAXTs3lUPU1MrBlUdFw==
X-Received: by 2002:aca:5a45:: with SMTP id o66mr12542922oib.121.1619813456838;
        Fri, 30 Apr 2021 13:10:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c7sm966221oot.42.2021.04.30.13.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 13:10:55 -0700 (PDT)
Received: (nullmailer pid 3805175 invoked by uid 1000);
        Fri, 30 Apr 2021 20:10:54 -0000
Date:   Fri, 30 Apr 2021 15:10:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
        daniel.thompson@linaro.org, lgirdwood@gmail.com,
        linux-leds@vger.kernel.org, pavel@ucw.cz, lee.jones@linaro.org,
        linux-fbdev@vger.kernel.org, cy_huang@richtek.com,
        jingoohan1@gmail.com, devicetree@vger.kernel.org,
        broonie@kernel.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Subject: Re: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for
 Richtek RT4831
Message-ID: <20210430201054.GA3805118@robh.at.kernel.org>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619421491-31494-3-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 26 Apr 2021 15:18:10 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Resend this v6 patch series to loop devicetree reviewers.
> ---
>  .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
