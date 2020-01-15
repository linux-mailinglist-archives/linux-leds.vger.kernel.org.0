Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2325213C609
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2020 15:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgAOObr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jan 2020 09:31:47 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:46073 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOObr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jan 2020 09:31:47 -0500
Received: by mail-lj1-f175.google.com with SMTP id j26so18784621ljc.12;
        Wed, 15 Jan 2020 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sOQxzN5NDYoxiTphKC0O7iNLkeFOG3BsOaRsIHhZ6bo=;
        b=JCx3UTfDxTUmVC1HYZ86QsSoFC4PJw/IYDcDJt7AbB9OB4T9cKnzURfMo45Oboso6I
         gITD2YhfQR51/LoxOhH5QAcda0pni3/gVXbN2GlROKU2XSn2iescZNzq7yMojnuVZSYr
         mp17IyTWtSTTYC3qDcI604in59dNDHw+IHGi+3U9LSgj1FGylg0OuvDzfM1zLnakHe7i
         w0IT0OQQ+VVwohV3I4gXx9DmV8Wjy0BdbMoUkuvSayWVQ1PX2yK0je9uBfL2t/2DTd5X
         g9KrXB/uk4cohgCw0238l8fdgZiOlo58WgFmxaaqZJSmKeOent00heBB1kWBRFy/NREv
         tx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sOQxzN5NDYoxiTphKC0O7iNLkeFOG3BsOaRsIHhZ6bo=;
        b=CKiBVE2x0L9pEMyzP8SVOxkOJq79+QyEPkPn+GErpTUsty2Gy2QiJCmM1RNCoU88OJ
         SKLziwV5OJIA++ZMVbGrJ5B2pECSvtE0nTHMpkEmehErXFdm/TdcquVhx4leDfdob4Ih
         kQRpgfxSpPQgMalgFP4Fmw6EwCy0CRIsoPB5sr1vGB4W++hYw+rr9Pz5X7oSBIgFHHHj
         WW9secl2JGCiYfI/phhgEUBHK9ysr3kQw7oT4Zc3DpaJeTD88oLEjdDU6vUBnBW5p/hH
         Gb6zAAJsEcaa9fNMMhZdguKcSbsrz1f68ZiCe+oSfXTHrP0F2Xa+AFljEZja+7zJmJBG
         6cOg==
X-Gm-Message-State: APjAAAVDnT8NQFf/vEzR1wD3HxeclxmVgjWslBYDq8tzhjlVFwMqrVpC
        r6+b2PPOuTbd8aCocnaG0xRUlsy3f6dUSWMdUno=
X-Google-Smtp-Source: APXvYqxBNivdjDB9UAkh5jr3+ZntG61mIWj3gXLK7oRj/tKsNxCCY+tZKMT6VBSs4qeRqL3G6ZRLGxcHmyl1IEfTyBE=
X-Received: by 2002:a05:651c:282:: with SMTP id b2mr2005368ljo.41.1579098705191;
 Wed, 15 Jan 2020 06:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20191212033952.5967-1-afaerber@suse.de> <20191212033952.5967-23-afaerber@suse.de>
 <20191221202755.GN32732@amd> <506d0697-1820-7811-1b38-910355812948@suse.de>
 <20191221210406.GA13125@amd> <1b3fc7f2-3c10-9b11-37ac-1bc7b0aa47d8@suse.de>
 <CANiq72nA9OLa0SjY8W055J_2A32tcp7S98SruKSdWH2dm25VKw@mail.gmail.com> <56f7cd23-2156-a6e4-15fe-3efd5ccf851b@suse.de>
In-Reply-To: <56f7cd23-2156-a6e4-15fe-3efd5ccf851b@suse.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 15 Jan 2020 15:31:34 +0100
Message-ID: <CANiq72nUkMj5bg8CDAg-2G0wdAjAe2CdHL5mb2cwWXF_d4Qgtw@mail.gmail.com>
Subject: Re: [RFC 22/25] leds: tm1826: Add combined glyph support
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andreas,

On Sun, Dec 22, 2019 at 4:14 AM Andreas F=C3=A4rber <afaerber@suse.de> wrot=
e:
>
> Please find the full series on, e.g., LAKML:
>
> https://patchwork.kernel.org/cover/11286939/

Sorry for the late reply. Thanks for the pointer!

> As explained in the cover letter, the problem here is that I don't know
> the model or manufacturer of these unmarked white-plastic-frame LED
> displays. So we have neither a filename to use in auxdisplay/ nor a DT
> compatible string to use for those displays.

For the filename, I don't think it is a big deal. Just use whatever
you think would fit best, even if it is a generic name. The most
important bit is having a clear Kconfig (and being disabled by
default).

Cheers,
Miguel
