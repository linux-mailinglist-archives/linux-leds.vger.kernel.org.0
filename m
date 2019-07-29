Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001EE78F08
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbfG2PV0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 11:21:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44213 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfG2PV0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 11:21:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so28427567pgl.11;
        Mon, 29 Jul 2019 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TwfQwt6LD/cxb9biYp1Swn/1NHjur0aXs6Bu0dcwxbc=;
        b=UQRYLyGF3XOYZJKFpELr3jKuI0Fwk2dKgQoZR5McEfKZBvfT3FXkEUO/AaJjjC6228
         yDHj3eD3E1mXMEiCijZCXMRvwe9CujBlYb1W/991gbrDUlkP9bU6JJvwL3rL0sCrq+Lx
         bxIaC1Wl2ZM/IQ3jY9byclaW3LbDDTZj1icltPMmb/OWvZW0F45eHA8k/k89pv4T4tpR
         Nu7QEZAsa6E21PJL+y016LWp+Y/oS3GfPxppeiTY9T4tFrPLmdBVRGiKTH9PXiZdNlqj
         hMyDjFli5mLASWNBzei2MLvRXH8M2HitaxsQIC5g+PJEfA6b/eeKvg6VLITxaputQGd1
         nbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TwfQwt6LD/cxb9biYp1Swn/1NHjur0aXs6Bu0dcwxbc=;
        b=UREyGDmg/2JS/RQiZpl9PRDMmaMZSSJaJH9I+Hln7Z7dsGUpAbvN1zkNcVUH6s7Veq
         LSu36M+wpa4YrIT1NqaH3Q/GSALGNUAZoDzcKaSZxtADn4RMYRmqkf4VvaZnwF0CiEZY
         E2yJZBNbEHsupnhcCqE6aTkuHJXHlKn5w5G+WeYTuJREzqvudnHaj5Fg2IvdSwjW7FMt
         bj8Z4Z2tPYqtje6SAfGYYiJWxx9ztNzBNUAk9K8/z8TRyBHy0A3ZxGcu2UMI6u6VL004
         tH54FgPVrEX7G0IsQ7R1987HhgPRu4GrhZLjlDqKEuSHZQCBVT9m/QayTsbTJKfqn0El
         DfqQ==
X-Gm-Message-State: APjAAAWP9a6PU4fQm42gNjKokxyo/+2Zv3Z5QSb1/VrjQKhFjTtka/D3
        1ZFRDQ+nydryhL9BaI2Yulwxk6dMkf3j8eGVa6s=
X-Google-Smtp-Source: APXvYqwG1i5tUPO+UoK9/5VWAU2u7Ro7sloiP4Fhq6RNEnBz6mfxah8ZzSWSRJ8xVPdISajqbA5KC+qNwxPLMh8txZA=
X-Received: by 2002:a63:4185:: with SMTP id o127mr64617641pga.82.1564413685438;
 Mon, 29 Jul 2019 08:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
 <1564322446-28255-2-git-send-email-akinobu.mita@gmail.com> <85aa571d-69c4-a35c-8b9a-770cc3662baa@gmail.com>
In-Reply-To: <85aa571d-69c4-a35c-8b9a-770cc3662baa@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 30 Jul 2019 00:21:14 +0900
Message-ID: <CAC5umyggeHZJrW7BR7o+GgnQiW5zaSP+cqMeW_CgWwqLVOjNZQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] block: umem: rename LED_* macros to LEDCTRL_*
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=9C=88) 2:30 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> On 7/28/19 4:00 PM, Akinobu Mita wrote:
> > The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
> > values.  The LED_OFF and LED_ON macros conflict with the LED subsystem'=
s
> > LED_OFF and LED_ON enums.
> >
> > This renames these LED_* macros to LEDCTRL_* in umem driver.
> [...]
> >
> > diff --git a/drivers/block/umem.h b/drivers/block/umem.h
> > index 5838497..8563fdc 100644
> > --- a/drivers/block/umem.h
> > +++ b/drivers/block/umem.h
> > @@ -32,16 +32,16 @@
> >  #define  MEM_2_GB            0xe0
> >
> >  #define MEMCTRLCMD_LEDCTRL   0x08
> > -#define  LED_REMOVE          2
> > -#define  LED_FAULT           4
> > -#define  LED_POWER           6
> > -#define       LED_FLIP               255
> > -#define  LED_OFF             0x00
> > -#define  LED_ON                      0x01
> > -#define  LED_FLASH_3_5               0x02
> > -#define  LED_FLASH_7_0               0x03
> > -#define  LED_POWER_ON                0x00
> > -#define  LED_POWER_OFF               0x01
> > +#define  LEDCTRL_REMOVE              2
>
> This way the namespacing prefix still begins with "LED",
> which can lead to further conflicts in the future.

How about renaming 'LED_ON' to 'MEMCTRLCMD_LEDCTRL_ON', and 'LED_OFF' to
'MEMCTRLCMD_LEDCTRL_OFF' ?
