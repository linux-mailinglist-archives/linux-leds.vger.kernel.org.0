Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7822F40BADE
	for <lists+linux-leds@lfdr.de>; Wed, 15 Sep 2021 00:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbhINWB2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 18:01:28 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:39664 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhINWB2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 18:01:28 -0400
Received: by mail-ot1-f47.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so677713otf.6;
        Tue, 14 Sep 2021 15:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1+WLR65qTBoUub6/pKXyNbktbZPgOslN8+Xmkk6CTLc=;
        b=gMkWFAvg+xfgzjR8+jNqi9dOrIDkdO7DIbrN+3/Ciqrf2rz1AraSCeqnecO8mhk3zd
         LJMSecY4h/4r1waRd5VVxCTj/L0VyqvNdbAtASKVFRLFHADhHapHyOcxaE0SNVzJxFM7
         8/yvac59177znNpEun7teaoM62vZaozJsW2qTuBpDBIvys55dZSRePtW8AIgnivg3lDz
         /pq6qM+O62EB5sjNHNMOvZq0qT8ZuE8aZM/Fq/L1eB3eJh1FUbfyG7v67fehuG4vXJLb
         1yk0C4T1tfL7UoggCoDz2Pw6xyhXklzbGk307InjVw7v97B5W5+iGWTOXMtdbD44GR7t
         9BOw==
X-Gm-Message-State: AOAM533uMD9a34XGNHBi0AjPVPCwN1B5ArDl31/mDxfdbGp/fa9eVFoK
        k3C0NDsFkPmSvsHyxoVH1g==
X-Google-Smtp-Source: ABdhPJz1pOO1WsaRumXrQshfHtdpfhL6MTWP4mSSbUpKyygYT9dlE16+Hwncpuov78gSO5mXYexJIQ==
X-Received: by 2002:a05:6830:78c:: with SMTP id w12mr16229945ots.196.1631656810214;
        Tue, 14 Sep 2021 15:00:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k23sm2943388ood.12.2021.09.14.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 15:00:09 -0700 (PDT)
Received: (nullmailer pid 4040654 invoked by uid 1000);
        Tue, 14 Sep 2021 22:00:08 -0000
Date:   Tue, 14 Sep 2021 17:00:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in
 addition to 'vco-offset' for register address
Message-ID: <YUEbaEzKT+cCYk9z@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
 <20210913192816.1225025-6-robh@kernel.org>
 <163164958886.763609.7483570624844319215@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163164958886.763609.7483570624844319215@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 14, 2021 at 12:59:48PM -0700, Stephen Boyd wrote:
> Quoting Rob Herring (2021-09-13 12:28:13)
> > The ICST binding now also supports 'reg' in addition to 'vco-offset' for
> > the VCO register address. Add support to the driver to get the VCO
> > address from 'reg'.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 
> I don't think this driver is changing much so you can take it through DT
> tree if you prefer.

clk tree is fine. :)

Rob
