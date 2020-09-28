Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9426827A941
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 10:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgI1IDo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 04:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgI1IDl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2020 04:03:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC4AC0613D0
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2020 01:03:40 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so168734wrn.0
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2020 01:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5c8rGgT34CWyrrefDHjKaJQ7725a47R5T6yl0/KLFHg=;
        b=fU0HlbH+nbIGIOjrcnRQVUlq9lbF4G31CCW0J9WPKlPTQg0NhBfiHMqx4TkhPksRcA
         LTE6UAFUxEG1dKIVrpBWsNpNq4bX1QoihUFRvwRRM/d308rZG5GGaztuRKwR8K2UXSvL
         ORGURPz8UXzksxYLSY3ed5c6U+lvCLJ46h5IqnHkZGD6Rj6IQQznXe3CPaaAeBk+D0Ld
         YAvH267wpjAwZQP9WaEJnMCV3P1ccVxv0lPLEIT1InJi9zWUAjKiGgH1SIAQ4spBsy80
         nuZYehv89mt7o+ZSAaEdtwIsrAsEWs+pwfnW51OZGyRrSljdDkwzrqVAcH7R2yhLirA2
         6iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5c8rGgT34CWyrrefDHjKaJQ7725a47R5T6yl0/KLFHg=;
        b=m6aS0Gac2sbifyEFoiQx8eiZDiCfCjuJpFgedUMaESMgEhKvErtx0HjQrRzkQiN4TI
         zgCBccHGh2dWY78B37kEJM73Q3odBj1GYO7wtz0JkFdJl1clfrjbMJblp+nZ/TO1Z0OF
         DgMiG+aPMlUjbGJsnJkJruIuqa++JiL6qd/Uw78nyA/cjnPLMFDz8T61RLCYvKfbRt0Q
         9jgjLzpGr1zwDPLR/NLJVnVL9nWMZe7nw0V1vf4X+AEwZqjiJcw3dGF4bGq0cQhYtvrk
         tsAcDSliyxOy1V+DxngdrdN9e/LGgCAt6tha7vW7fTnROGmpbrt9XKCC53VvX+VG2eU5
         tbhA==
X-Gm-Message-State: AOAM532alWsA2HVMcJMFadqsSCTc2lBWz8dKGVpgr7WWz/aE0wGb6nTY
        s3Evypcv00d1iBCO1mDAFxf0XQ==
X-Google-Smtp-Source: ABdhPJzsjgZytiFI1ScdwSKUycH1MXJBoSICwLH5dRRY6GyOMI2AG7qvjd8CxzvjehVNec6TMp7Gbw==
X-Received: by 2002:adf:a418:: with SMTP id d24mr279994wra.80.1601280219307;
        Mon, 28 Sep 2020 01:03:39 -0700 (PDT)
Received: from dell ([91.110.221.154])
        by smtp.gmail.com with ESMTPSA id 11sm189813wmi.14.2020.09.28.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 01:03:38 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:03:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH leds v2 05/50] leds: various: guard of_match_table member
 value with of_match_ptr
Message-ID: <20200928080336.GA4637@dell>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-6-marek.behun@nic.cz>
 <20200918061500.GD26842@paasikivi.fi.intel.com>
 <20200918112058.6d3b0d5d@nic.cz>
 <20200918095759.GG26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200918095759.GG26842@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Sep 2020, Sakari Ailus wrote:

> On Fri, Sep 18, 2020 at 11:20:58AM +0200, Marek Behun wrote:
> > On Fri, 18 Sep 2020 09:15:00 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > 
> > > Hi Marek,
> > > 
> > > On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:
> > > > Change
> > > >   .of_match_table = xxx,
> > > > to
> > > >   .of_match_table = of_match_ptr(xxx),
> > > > in various drivers.
> > > > 
> > > > This should be standard even for drivers that depend on OF.  
> > > 
> > > After this patch, none of these drivers will work on ACPI systems anymore.
> 
> ^
> 
> If CONFIG_OF is disabled, that is.

What?  of_match_ptr() is designed to change depending on OF or !OF.

Are you confusing this with acpi_match_table()?

> > Hi Sakari,
> > 
> > I don't understand. Why not? Does ACPI subsystem parse of_match_table
> > as well?
> 
> It does. The compatible string is used the same way as in DT for matching
> devices with "PRP0001" _HID or _CID.
> 
> Please read Documentation/firmware-guide/acpi/enumeration.rst .

Could you allude to the specific line you are referencing please?

> IOW, you can safely do the above only for drivers that depend on OF in
> Kconfig. Otherwise you'll probably break something.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
