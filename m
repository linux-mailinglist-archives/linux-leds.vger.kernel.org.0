Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A46263240
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 18:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbgIIQif (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 12:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731082AbgIIQhP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 12:37:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A532C061346;
        Wed,  9 Sep 2020 06:52:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n3so1346340pjq.1;
        Wed, 09 Sep 2020 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ijCapkR9xLuIbyX+brDKlgI4YJ2GKv1b98NiflJOr8c=;
        b=TQpvhIB8mAoPHnxUUYHYKh2Ojvveec7c3l080EdGK6DjVlkNL7tt/oXWaOi12qruOJ
         ORV2aFSYWalR+IXpmNVrbLUQMg/Q55iVMlFlxCIjsCKVAoz2OVuMIVCkE/0Ff3m+PO/g
         OswWzMFWgr2ukwyRUkIn3t0iWJS9OopSbCdVbJMyIArhz9tzwEm44GCURB/hJk91s0/t
         IUyaFEhqjDuHP46OGkZ2Gcr9dp7J9UCSEo3hSkyCtHer6bab9RmesX8lnkr449IBu7Nr
         xFYmK6adO1SjRkCLXaYjA3y2sRciVPZkgzEw1z+eG4nn3CleWdtKNDm/yLzM2DPvE+fc
         C3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijCapkR9xLuIbyX+brDKlgI4YJ2GKv1b98NiflJOr8c=;
        b=CglJo5YTMwhZy6U/qo+JoIXISbuolyyt7myATNBC3mKtQ8KD1D82kt4OEzlfgGqide
         EnEhXDrBScygWoLIaxmfoF0xo3iTKAmLDIHF3AA+seH8HAT16kHuCHveBXiXJoNLtBRg
         e2igbncgiPTkmrJJgOgOy217F9Q98u6mkBwdeNsLQCxba5DxzcX4KtDBoTY+VAZXRjsh
         JeuMlhmQeOMN9ebNUyAFhnty86hn/gpZ9r9mQLcWFBb78eVL45/YvIlVdVz295+HyiFc
         9EEqhAwsIQqhSGrbTz/Nd08IBkVIxjR2RduxQWrsU1nZeb0HSgIUmFDzrbKr6K3GneKl
         Ni8g==
X-Gm-Message-State: AOAM531HH9pqd3h36lP/O+pmmNmmB0U48Tmd1Zd3osG/oXyd4friVn9S
        yMk0ZmjGv5NNm2mZoBXgR5WHVJYgKvsrF/swyRyKj2oocmJmUA==
X-Google-Smtp-Source: ABdhPJxlkAfs7B9JEE/N2GFojP20lgwfdq5VPigaVxLUUrzzdVSRxRi6pB9QGT8N3cLXmxdkUNF42Nav5QPJpu2ug4U=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr931343pjb.129.1599659558356;
 Wed, 09 Sep 2020 06:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-5-luka.kovacic@sartura.hr> <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
 <20200909103638.GB9222@amd>
In-Reply-To: <20200909103638.GB9222@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Sep 2020 16:52:20 +0300
Message-ID: <CAHp75VcV6Tn8dVjWhOW7bfcjwA_Vabw91FJ=OYit3e1rvPp1qQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 9, 2020 at 1:36 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > Add support for the iEi WT61P803 PUZZLE LED driver.
> > > Currently only the front panel power LED is supported.
> > >
> > > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> >
> > Can we make it OF independent?
> > See below how to achieve this.
>
> Is there reason to believe this will be found in non-OF systems?

It's one aspect. Another one is to give a better example to anybody
who might use this to copy'n'paste from. I believe that most of the
LED drivers can appear on non-DT systems.

-- 
With Best Regards,
Andy Shevchenko
