Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE33BEB35C
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2019 16:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJaPGI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Oct 2019 11:06:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43478 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbfJaPGH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Oct 2019 11:06:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id 3so4548735pfb.10;
        Thu, 31 Oct 2019 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aQQdueZH/eKXSKk+PwrJBs8Uz0zrwt/H/dSmnbFJlc8=;
        b=c+P6rpmYISPGDC5K126fVe/cpTMdcs//Xhfu5cAl4eXSuW9R50ESGxqoiDedHVRwg7
         GPjnL8QqPOC9GoCNhsK7vicUBtBf70Ct2JmKb0Yt76jCYt6rkL52gthZgoFMU6Vexrp6
         UgbxYmyBT5x/HDYdE7cYgPIcp9c+S2gcsPhSR/lGu8Pns1Y8DW7zOo2GVb+b33tEA/Zy
         ZH3t4biqyJUEkBwmr3IbfrPwbelJHBxTTRy3r7TZGRERquD1yBf/Mk4Yfy/fBOSkkrls
         6naR7Jxlrez53JzIfU5+e9RN0pqAwfxGtX0sRSLOAtivpOxHKXWnNaPBwez7R6lX0eeX
         M5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aQQdueZH/eKXSKk+PwrJBs8Uz0zrwt/H/dSmnbFJlc8=;
        b=NlkUFkYYYgARkoppglpDh6g58hfprShh6VGDEuBUdvifCRd0xCh5ACFO6cWHGve4wG
         uFjF4NyFbLDEOpwmdlh3cBnToU+8CZ86cg/YwpGFQo79NQi8nU0JgTbY1WYH+vtk2ziz
         laefj+XaHomUNpxSepn+1R6PvsNkKPCZmVK45HjS3AIHeRq1ZXM4Qmr9cWIs6Jl+9AXk
         yOIroMlS4xl7Ygi809Gi1CMSMY24kt/DGZNI8aisAW2QL5vKhpwJnQlHY4+/Mmrh7uDf
         UyZWffAe/T2aL80Tm4CZcfbrBZOk9fOVQs3k+vo+XZP3lbTs+p9w9oAgSxH6vWKx+cvU
         Tidg==
X-Gm-Message-State: APjAAAVwhVtHwwjHZPLsfsoFA5qLasnfXl4yBU9+3InHaZYVx2sfoo6X
        FWHbhLNmgSlWR7ybnDKbbLe7OHyTY3TtaT8i5WY=
X-Google-Smtp-Source: APXvYqwmDbdtPu/i1FNIN9/w6Ny4clnYWdl5KUnedpMAFwvmLGJ0nDRYLFLdXLbFnKlr4ZeEwM25w2PVaxL94BmDAa0=
X-Received: by 2002:a17:90a:f48f:: with SMTP id bx15mr8199576pjb.115.1572534366617;
 Thu, 31 Oct 2019 08:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
 <20191030142417.GA8919@bogus> <CAC5umyhZ+w9b7M=gWGDynoMerZ7FiP3+U_RXyQ2P_p7cuLVRgA@mail.gmail.com>
 <CAL_JsqKa=936WNhTDQ0S9bW0fYPMHQXSwutjnQs0W9vP8h7sow@mail.gmail.com>
In-Reply-To: <CAL_JsqKa=936WNhTDQ0S9bW0fYPMHQXSwutjnQs0W9vP8h7sow@mail.gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Fri, 1 Nov 2019 00:05:55 +0900
Message-ID: <CAC5umyh0_2MN4=uin91sYVWNxvF1uwg_bEWME0XKurTiV08q0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
To:     Rob Herring <robh@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B410=E6=9C=8831=E6=97=A5(=E6=9C=A8) 3:29 Rob Herring <robh@kerne=
l.org>:
>
> On Wed, Oct 30, 2019 at 10:27 AM Akinobu Mita <akinobu.mita@gmail.com> wr=
ote:
> >
> > 2019=E5=B9=B410=E6=9C=8830=E6=97=A5(=E6=B0=B4) 23:24 Rob Herring <robh@=
kernel.org>:
> > >
> > > On Sun, Oct 27, 2019 at 11:09:38PM +0900, Akinobu Mita wrote:
> > > > Add DT binding for generic LED level meter which consists of multip=
le LED
> > > > devices by different drivers.
> > >
> > > Do you have some pointers to actual h/w?
> >
> > This doesn't require a specific hardware.
>
> But I do for my understanding. If I don't understand it, then my
> default answer is: no, we don't do "generic" bindings because the h/w
> is never generic.

For example, https://www.switch-science.com/catalog/2677/
The LEDs on this board are controlled by NXP PCA9956B.
The driver is under development by Bjorn Andersson.

But the LED level meter doesn't depend on the actual LED controller driver,
so I call it "generic" LED level meter driver.

> > If there are more than two LEDs that can be described by devicetree,
> > it can be an LED level meter by bundling them up with this binding.
>
> Depends on the physical locations too? If you just want to group any
> random LEDs, then do that from userspace because it's more flexible.

Yes.  I assume that the level meter's LEDs are mounted in a line, or matrix=
.
I plan to rename it to 'leds-array' because 'leds-meter' is unclear.
