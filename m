Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A346925DBF
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 07:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfEVFnC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 01:43:02 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33272 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfEVFnB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 01:43:01 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so3832273wme.0
        for <linux-leds@vger.kernel.org>; Tue, 21 May 2019 22:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UV86+9faBPyxG3LMeaUxCHb1Y1cnH/FV7fOPtgG5S98=;
        b=DsZP4LP2cJulyBy4GynzLKTHzyJoCoCR+MG+Z+gHUf7P1+KlPTqh4MZlQ7dWkHBh1B
         8iggThqkjVvRIhwpfIRB8fpHfRS7GEWqv8mxWIWY0uSi8D+dXMP3g5QjDJV5gUwDXHVG
         MkR2NAAvUo3zXH4PatvV5weAw+f8j8XGfuUTyu9kkecLb5pJ93Zt+0vKqvhPzaFAegJH
         qItzRiDiWbTKGma/Qlw+i6uhs2NosSoFdC725fNRNWHUMe1tKyhj/kZlZeoRFassCZLo
         Bb/kdKZZXVy1sRbybIYU3prXHhmpf5XnffKDZCImKEFh+F77yid5QUrVMA21O8u2miet
         O1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UV86+9faBPyxG3LMeaUxCHb1Y1cnH/FV7fOPtgG5S98=;
        b=BDiXYTEGGwrLMM19t1MdA7ZOYCZDer4X4B0ByQzmrN4Xtl6sNjsx+eSe3QGqBDwAMh
         LIOOU1GwxfmxCPVmcFzBikk0AFkQ04nyTwKquIYfTXVCGn8Z59urvXEvsb7/bXoaAfIv
         G7+V5mL7vE78NkRhq5J7HblfMUzXdEHOZKJQxaYd1Hr0pQSAY+4EEkxtG6nYLyENhEAz
         /mQIOZ6oxCP/ofJWblvmK18N9bgyAC1hEikljRV5Rttp+6zqbYWssNX61sSQ30oNy1dM
         TXnM4NfzdPZQpMiJZqd5lPGxC2+xk86hfV+0rKjdnZrejELkNDx3Ih5xOKRL0EJDZxdS
         BCkQ==
X-Gm-Message-State: APjAAAWXiBUVObI8acyKTyftxli3Lj7U+kl3sgdPc4Ha2dSEW1eJAq43
        OusFdAaCDeHjJNBsOXMUORFI/A==
X-Google-Smtp-Source: APXvYqx3ytJTwrdokltodLpxK93jWrnPf+fMI1jolPsXgHoB5MtfXMSEAoN/yUl4y3UJqS1NcpWM8A==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr6258184wmh.132.1558503779936;
        Tue, 21 May 2019 22:42:59 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id j17sm23295196wrs.77.2019.05.21.22.42.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 22:42:59 -0700 (PDT)
Date:   Wed, 22 May 2019 06:42:56 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190522054256.GA4574@dell>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 21 May 2019, Jacek Anaszewski wrote:

> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
> 
> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
> 
>   leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
> 
> ----------------------------------------------------------------
> TI LMU LED support rework and introduction of two new drivers
> with DT bindings:
> 
> - leds-lm3697 (entails additions to lm363x-regulator.c)
> - leds-lm36274
> ----------------------------------------------------------------
> Dan Murphy (12):

>       dt-bindings: mfd: LMU: Add the ramp up/down property
>       dt-bindings: mfd: LMU: Add ti,brightness-resolution
>       mfd: ti-lmu: Remove support for LM3697
>       mfd: ti-lmu: Add LM36274 support to the ti-lmu

These patches were Acked "for my own reference", which means I'd
at least expect a discussion on how/where they would be applied.

It's fine for them to go in via the LED tree in this instance and I do
thank you for sending a PR.  Next time can we at least agree on the
route-in though please?

>       leds: TI LMU: Add common code for TI LMU devices
>       dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>       leds: lm3697: Introduce the lm3697 driver
>       regulator: lm363x: Make the gpio register enable flexible
>       dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>       regulator: lm363x: Add support for LM36274
>       dt-bindings: leds: Add LED bindings for the LM36274
>       leds: lm36274: Introduce the TI LM36274 LED driver
> 
>  .../devicetree/bindings/leds/leds-lm36274.txt      |  82 +++++
>  .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
>  drivers/leds/Kconfig                               |  23 ++
>  drivers/leds/Makefile                              |   3 +
>  drivers/leds/leds-lm36274.c                        | 174 +++++++++
>  drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
>  drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
>  drivers/mfd/Kconfig                                |   5 +-
>  drivers/mfd/ti-lmu.c                               |  23 +-
>  drivers/regulator/Kconfig                          |   2 +-
>  drivers/regulator/lm363x-regulator.c               |  56 ++-
>  include/linux/leds-ti-lmu-common.h                 |  47 +++
>  include/linux/mfd/ti-lmu-register.h                |  63 ++--
>  include/linux/mfd/ti-lmu.h                         |   5 +-
>  15 files changed, 1112 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>  create mode 100644 drivers/leds/leds-lm36274.c
>  create mode 100644 drivers/leds/leds-lm3697.c
>  create mode 100644 drivers/leds/leds-ti-lmu-common.c
>  create mode 100644 include/linux/leds-ti-lmu-common.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
