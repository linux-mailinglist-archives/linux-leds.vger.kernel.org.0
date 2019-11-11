Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E24EBF7F7F
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 20:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfKKTLf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 14:11:35 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:43360 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKKTLe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 14:11:34 -0500
Received: by mail-io1-f67.google.com with SMTP id c11so15784427iom.10
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2HgDUfvYTFbpP69aWKc0kGJILBYPdrw3d304UudQR6Y=;
        b=eTbtsuOY1bdhKdbXYiPZJ/aG2Qace47DkAJbL4Op2wp42tGwtELx5aJ26CvJ9Jb3qT
         vlhJLgZkDCviw9bLoBdRKzAEYECphGMJH3AnxorVg1SBo/rDG5z1xL1PRUcddapYELJc
         JlDIgnKwPtZybDPnZO/Vil39jXyaJ3tn4cWD3olZQTk/Xys15Qnjc5WHDiyzLrr1dhpI
         gUDI74hAWak5E6pqdOxyvLhSsu+bf3+IfPyWmb5suN58S2X3MoWTIFC9SW4Y0R3aIW+5
         ErM2InmMnwLQIG+6QpsYESxWHX25EqnFNz7/WEo+Dks7zTq3u5LsV9tqWiolA629rCzm
         iHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2HgDUfvYTFbpP69aWKc0kGJILBYPdrw3d304UudQR6Y=;
        b=XKGCHw37PzPExGfkTwexAigKoffNUnAPkn5vGJwH8FyRd8inYSLzbxAh/LaBRAi3Up
         EXrxztKc2fZFAKMIyzPxfLthU6y5SZbMokE51Jp09NQSJxf4utTmA6pZaIS/BNjh6zMP
         zjOBAv9S7iPTcgB+KHTA2FhYlQPJK9xHDYwAiJ2iXVSOD6VcW2Cz5j7gPPk/h5aMm2j0
         AoZdadz+FSpI7SBjJTkK3Kqs/vVDKL8+dVUiO3DOAlCZnonb6YGoSdI8aYEb770qjBPE
         nxNFibJXqbmrs5NQn0y01vStVeQdPDom4tvh50QNnNzDtW6PqIBrsRQzJgGrVIp5YXWU
         Isxg==
X-Gm-Message-State: APjAAAVHHmaJWkEB4f4Wa3ZE0xFkDTPId+yr8KEN2KtuTv9TBjAdF30Q
        +mBRPkMIZ2kIPnNewZdjk8oJwVqf5UWH0ssCw9K/Yw==
X-Google-Smtp-Source: APXvYqy1znbPoGeXemeR0vFArovOl/+lq8cNdMivbT38ZF3jpW8pGC7IQIdwYmdC0F0dJSIodB17Xximee0fFWz8NMY=
X-Received: by 2002:a02:c54b:: with SMTP id g11mr2199988jaj.136.1573499493869;
 Mon, 11 Nov 2019 11:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20191021124428.2541-1-brgl@bgdev.pl> <20191021124428.2541-6-brgl@bgdev.pl>
 <20191111080837.GF18902@dell>
In-Reply-To: <20191111080837.GF18902@dell>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Nov 2019 20:11:23 +0100
Message-ID: <CAMRc=Me_b5c_e+qZ1s=TgTh7k_bQqrqthC8VTb7ak8+3AOEugg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: mfd: max77650: convert the binding
 document to yaml
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

pon., 11 lis 2019 o 09:08 Lee Jones <lee.jones@linaro.org> napisa=C5=82(a):
>
> On Mon, 21 Oct 2019, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Convert the binding document for MAX77650 core MFD module to YAML.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../devicetree/bindings/mfd/max77650.txt      |  46 ------
> >  .../devicetree/bindings/mfd/max77650.yaml     | 149 ++++++++++++++++++
> >  2 files changed, 149 insertions(+), 46 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/max77650.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
>
> Applied, thanks.
>

Hi Lee,

FYI this series is already in next through Rob's DT tree.

Bart

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
