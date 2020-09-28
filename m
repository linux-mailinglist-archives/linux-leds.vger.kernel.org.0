Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B50427A952
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 10:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgI1ILS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 04:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1ILS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2020 04:11:18 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D08C0613CE
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2020 01:11:18 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x14so120509wrl.12
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2020 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3Om8AM0og3VSpQeTBf6KDEd6fTvU4EBwksk93Od+7XE=;
        b=zP8NYXRey8PZiMa7RFwghBPT2Dc4+Ur8JaLQI+2+KYxtrdBbqWKx48YjuRKHPPWSOU
         5xt7FKRwGDHAE6z93txxJTSUOg+C2tezWbuztJ4rhH/vOdkhrzQcCqXphX+RhSOKcgTG
         6QAWX0bDLdtsqTxL1B7NLqf/8PGxGoiO3IQNcVmQ9q5AQ2iK8KRW2lTNC0snqyRBKmg5
         PPVCceUSJ9eW3Yp8Dvf7mcmYfSuGALqaTJ/TSog6tXvL8mhKsuLKzytTgabdr1S0kWZh
         DSyectg7UHR8he9nZWUernPUsT+eUWdd3KIxmED2ynqZouc6//KO7mas53rIuEziLJmg
         FteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3Om8AM0og3VSpQeTBf6KDEd6fTvU4EBwksk93Od+7XE=;
        b=DhwSU6VZaAAVkyD6uCc6psC/5JorUklV/RLE6SU3FE+5+DSCZ4hNAVjDHl+iTPDh6r
         7kf3YiCJzeykJvvGmBwVkkMLk7gVLNVZFpnprv182BYZlOrQnrw8aI4F5AqnjnnIpd0P
         8YSRbKaB+roTrkPeJ+bdwTD5LuFAkjhtq4NzouB7cgcXy3d+H+pKJA7lWsDtncmLU8E/
         FmiH79hJ9YD4Ibpe/V+6yVus3p7eETDaxT+YAUzba8cKTibQu/P2ciGZUms7cCnH1uO6
         AAkU5vySzor61bA7MgIHfW0hp2zLLr29Pbh6qsEZTIYMD6xuvNIpeZbkjkngWmxKXox3
         oibg==
X-Gm-Message-State: AOAM532xkStQtKfH7Qo04O8pNf5lBrOxas0/DEJTQb4psSUxnz8U2LA6
        pLhkEYJNnOlljAzOnQErBLIurA==
X-Google-Smtp-Source: ABdhPJx4wZkzF3Cjm+E8FPeYtfeDpEEWLUCh5tL5TcU4QxwFiQSUEj89+dCLi1uscJNz2vM2DABLlg==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr240193wrr.273.1601280676803;
        Mon, 28 Sep 2020 01:11:16 -0700 (PDT)
Received: from dell ([91.110.221.154])
        by smtp.gmail.com with ESMTPSA id c4sm222217wme.27.2020.09.28.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 01:11:16 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:11:14 +0100
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
Message-ID: <20200928081114.GB4637@dell>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-6-marek.behun@nic.cz>
 <20200918061500.GD26842@paasikivi.fi.intel.com>
 <20200918112058.6d3b0d5d@nic.cz>
 <20200918095759.GG26842@paasikivi.fi.intel.com>
 <20200928080336.GA4637@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200928080336.GA4637@dell>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 28 Sep 2020, Lee Jones wrote:

> On Fri, 18 Sep 2020, Sakari Ailus wrote:
> 
> > On Fri, Sep 18, 2020 at 11:20:58AM +0200, Marek Behun wrote:
> > > On Fri, 18 Sep 2020 09:15:00 +0300
> > > Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > 
> > > > Hi Marek,
> > > > 
> > > > On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:
> > > > > Change
> > > > >   .of_match_table = xxx,
> > > > > to
> > > > >   .of_match_table = of_match_ptr(xxx),
> > > > > in various drivers.
> > > > > 
> > > > > This should be standard even for drivers that depend on OF.  
> > > > 
> > > > After this patch, none of these drivers will work on ACPI systems anymore.
> > 
> > ^
> > 
> > If CONFIG_OF is disabled, that is.
> 
> What?  of_match_ptr() is designed to change depending on OF or !OF.
> 
> Are you confusing this with acpi_match_table()?

Okay, I just grepped the kernel and found some OF matching in the ACPI
bus code.  This seems odd to be (at first sight at least).  I'm not
entirely sure how this is supposed to work, but when you disable OF,
one could reasonably expect any matching utilising OF based tables to
be disabled too.

Not using of_match_ptr() on ACPI enabled platforms sounds batty to
me.  If this is valid, perhaps the of_match_ptr()semantics should be
changed to include ACPI.

> > > Hi Sakari,
> > > 
> > > I don't understand. Why not? Does ACPI subsystem parse of_match_table
> > > as well?
> > 
> > It does. The compatible string is used the same way as in DT for matching
> > devices with "PRP0001" _HID or _CID.
> > 
> > Please read Documentation/firmware-guide/acpi/enumeration.rst .
> 
> Could you allude to the specific line you are referencing please?
> 
> > IOW, you can safely do the above only for drivers that depend on OF in
> > Kconfig. Otherwise you'll probably break something.
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
