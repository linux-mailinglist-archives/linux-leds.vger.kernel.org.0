Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B72336F7C
	for <lists+linux-leds@lfdr.de>; Thu, 11 Mar 2021 11:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbhCKKBa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 05:01:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:56828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232050AbhCKKBQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 11 Mar 2021 05:01:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6185D64E28;
        Thu, 11 Mar 2021 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615456876;
        bh=qab/eis9z/EVO4w5PPgq80weR20hVeyIMCDATGH6R50=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jHp1f7PGES6nlvq5NMep8FPviCMAOmmTiHASGwKxs3Bzvb/s/72B58wkw0AoralmH
         h5wmQTq9vF1wg4lypVJvWisgrIDN4SUSsTm89eyNvyib5r/NO5EgAEhOwvHorajwO0
         /f5pY4xb/mSiZQSXjwiPA51FUknp+1aDYJ77/VtroHrEzgpNrbrInwOXeE3rPWIfZe
         gzVTFgnOKJCpWzODRvNa6clxVuztDVZZto4FvbbdhIaI+rFqY8/zqhu+zWtUymFgeX
         IdLJb1FroG/b+AmmrGd3hLeXvfLbv8Rt+VrCzWMxp1SaEmuMta2yl2ngR5WN+XBREp
         L+YCVWCY3+nrg==
Received: by mail-oi1-f178.google.com with SMTP id q130so3579113oif.13;
        Thu, 11 Mar 2021 02:01:16 -0800 (PST)
X-Gm-Message-State: AOAM530xTIsmItn9sbCfZGZh7iz4amk6S08EHo+vcdq+fGoZt8Q9WAKm
        ZtT4tZVVRUX9ALa9/jEUygdHw01pZU6S5+ZmvLQ=
X-Google-Smtp-Source: ABdhPJy4t7Rk74k7pxLvO4hdxCdt0tjcMRvrr/j1LoTbdX+LVuBhI//3iyrXTRT/KX70UWWohRZKUDvXjsRZ2C5zSzM=
X-Received: by 2002:aca:5e85:: with SMTP id s127mr5479198oib.67.1615456875566;
 Thu, 11 Mar 2021 02:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20210308153052.2353885-1-arnd@kernel.org> <20210309180851.GA4669@duo.ucw.cz>
 <20210309193910.GA7507@amd> <YEgeoPqCCgTUEsSc@angband.pl> <20210310072831.GA29779@amd>
 <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
 <9a74ce79-b7cf-dec1-a64c-d928b5712645@hauke-m.de> <MN2PR19MB3486B88ADF5BE557BEE168AEAF909@MN2PR19MB3486.namprd19.prod.outlook.com>
 <MW2PR1901MB2187816296E1B03F91EB972BD0909@MW2PR1901MB2187.namprd19.prod.outlook.com>
 <MN2PR19MB3693B7620DABED199AA304B5B1909@MN2PR19MB3693.namprd19.prod.outlook.com>
In-Reply-To: <MN2PR19MB3693B7620DABED199AA304B5B1909@MN2PR19MB3693.namprd19.prod.outlook.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 11 Mar 2021 11:00:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2t-C5_JOcTUcYq1UCiDUDzMibvT0ToHut6hEJCtoj-YA@mail.gmail.com>
Message-ID: <CAK8P3a2t-C5_JOcTUcYq1UCiDUDzMibvT0ToHut6hEJCtoj-YA@mail.gmail.com>
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     Cheol Yong Kim <ckim@maxlinear.com>, Qiming Wu <qwu@maxlinear.com>,
        Pavel Machek <pavel@ucw.cz>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Mar 11, 2021 at 6:48 AM Rahul Tanwar <rtanwar@maxlinear.com> wrote:
> Hi Arnd, Pavel,
>
> Sorry for the hiccup due to missing email address in the email chain duri=
ng the ownership transition.
>
> Henceforth, I will be the maintainer for all kernel drivers/code related =
to =E2=80=9Cformerly Intel=E2=80=99s now MaxLinear=E2=80=99s=E2=80=9D Light=
ning Mountain SoC.
>
> Please send any Lightning Mountain SoC related issues email to Rahul Tanw=
ar (rtanwar@maxlinear.com) and I will ensure that I address the issues in a=
 timely manner.

Thank you for the reply and for stepping up as maintainer.

I tend to merge updates to the MAINTAINERS file as bugfixes the file contai=
ns
the correct addresses at all times. If you sent an update for this to
soc@kernel.org,
I'll get that merged.

Since I think this is an x86 platform, you can alternatively send the same =
patch
to the x86 maintainers.

Are you also planning to maintain or add drivers for some of the older SoC
generations from Ti/Lantiq/Infineon/Intel that are now owned by MaxLinear?
It would be good to be explicit about which ones of these you are working
with. From what I can tell, the arch/mips/lantiq/ platform is only for fair=
ly
old designs (xrx200 and older), while support for the slightly later mips
and x86 based chips was submitted a few years ago but never merged.

> I will wait for more details on your fix request for LGM LED driver. Than=
ks.

From my side, only an Ack on the original bugfix I sent [1] is needed, but
Pavel had other concerns about the driver. I expect he will follow up on th=
ose
with you.

         Arnd

[1] https://lore.kernel.org/lkml/20210308153052.2353885-1-arnd@kernel.org/
