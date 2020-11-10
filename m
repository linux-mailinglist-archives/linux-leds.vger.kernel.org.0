Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49662AE08A
	for <lists+linux-leds@lfdr.de>; Tue, 10 Nov 2020 21:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730468AbgKJUOq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Nov 2020 15:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJUOq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Nov 2020 15:14:46 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5FAC0613D1
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 12:14:46 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id u21so15633078iol.12
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LcGHI5HLTTMixiAoo4DwvdYmU5XWNIEPWiELjO+QW7Y=;
        b=UMpcvPcjlLhh/kl5mvTfd50lcLioF3hMJ3jOu6/aMUZXHLGcTwvS1+TMHy/M2b1+BO
         w4AoJQVRln8SBbIHpkfDVh6JBlDmSNWhlRKyzGsSny9MdOp63eo/6RAm6nk2cq55ek6p
         MsHNuJ0MRZyB5CMbcPDhlooJFaHaAaVcYMwHzJ7Nx3k/G3PRvNlCmrM+DLbhi66Fspml
         fPktd6wG14MGC5gS7CbKnKGw6sEEwWFaHi7CivlT2av+mmJVYAGOaQjf149Rt5FxZqz/
         8aysjOEOvnul07C0FBmTv1JXjy5PWuEDVfyB6GS3SrqaXcKSIkmEJyFZgrGML3wesK7m
         c3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LcGHI5HLTTMixiAoo4DwvdYmU5XWNIEPWiELjO+QW7Y=;
        b=fVBoc2U/rhomBDP/6iTsf6BFDDGaqDCENzkNSHVZuGTwNLaojDbgnh310mbKw+NX5c
         SdeQKPZWOsQcqyDnHum94fNiW2D3OrHT2VRm/DkmtKCSW/gZmjrTsNld6+EHcIcuJcYE
         rhyyBoBNXrcJWpOwxxSzPCCtJ/aremeEyvzKmAAVAGOLm74y8z0yZvoXq+czyTuDXUQG
         7U+kax0a/MimMWZ7lGEzuyxpmkkzF79DwK91Dq3fjrvxuGQbVnQdwn43HFWwAmWDMmVv
         O4yyo/k5AylvC7fRmY5MBACCnZNzM9QGr4K0Y7DturXL1ltGNWGXQfPX8l2aH01zO7gA
         z/hw==
X-Gm-Message-State: AOAM532sj2qEvLl/XWLqdTrqqZPaRcTATSMPs2zLwyzeJCPTcv7/oCxm
        /eQitK/mm/HlTl8wqqdmYyXN2RvizecGdT6e0XrZzQ==
X-Google-Smtp-Source: ABdhPJxJ5nCLlaslCGZ7rFMK8sVF6fRf6ubFOx1K9c+PBlOt2+l8gZJm22j48T4dN13f9n/gOQ/tqr7wSsDzhgVdI+I=
X-Received: by 2002:a02:c64f:: with SMTP id k15mr17291198jan.75.1605039285501;
 Tue, 10 Nov 2020 12:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20201019221859.56680-3-luka.kovacic@sartura.hr>
 <202010201049.3V7m9mtx-lkp@intel.com> <20201104152227.GM4488@dell>
In-Reply-To: <20201104152227.GM4488@dell>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Tue, 10 Nov 2020 21:14:34 +0100
Message-ID: <CADZsf3ZW2kvqoq=fnuYajRHtSOZzjL7O-Ycmif6d_Jucd3nFJQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] drivers: mfd: Add a driver for iEi WT61P803 PUZZLE MCU
To:     Lee Jones <lee.jones@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

On Wed, Nov 4, 2020 at 4:22 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 20 Oct 2020, kernel test robot wrote:
>
> > Hi Luka,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on hwmon/hwmon-next]
> > [also build test WARNING on v5.9]
> > [cannot apply to pavel-linux-leds/for-next lee-mfd/for-mfd-next next-20=
201016]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Luka-Kovacic/Add-suppo=
rt-for-the-iEi-WT61P803-PUZZLE-MCU/20201020-062048
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next
> > config: ia64-randconfig-r002-20201020 (attached as .config)
> > compiler: ia64-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/855e7cca9db335136d095=
55f9983d7245fca1f4b
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Luka-Kovacic/Add-support-for-t=
he-iEi-WT61P803-PUZZLE-MCU/20201020-062048
> >         git checkout 855e7cca9db335136d09555f9983d7245fca1f4b
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dia64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/mfd/iei-wt61p803-puzzle.c:311:5: warning: no previous protot=
ype for 'iei_wt61p803_puzzle_buzzer' [-Wmissing-prototypes]
> >      311 | int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *m=
cu, bool long_beep)
> >          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This bot has been complaining about this patch since at least v3.
>
> Are you going to fix the issue?  Or is it moot?

Yes, I'll fix the issue in the next patchset.

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Kind regards,
Luka
