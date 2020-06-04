Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F181EE632
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 16:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgFDOAJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 10:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgFDOAI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 10:00:08 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82858C08C5C0
        for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2020 07:00:08 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f5so5754966wmh.2
        for <linux-leds@vger.kernel.org>; Thu, 04 Jun 2020 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=GNoEAYQYDCnKyO2V9VlFu2leS/fO16RwHqfklA21VLU=;
        b=ZeRnsFPQME2ZptQ+uwTvQbUOsLUUWU2+g6Ez8ZKJH4P3tb8OVKDgsrofq2PNmhs3fp
         y8BB5xRtA3D9EYDriNInTakGWRO5vbt4MztYqnqw1Ra+mICLcoNZpNbGG5CPbWGHo9e1
         xNRcptJ2KosfvFo/iwZYaqNGqdOQLgDgQR/r0EGt1DjTKVDADjqYPwq/KecHayRhnaxi
         9h6Fk4uFYtbLmVtO5xRa41TqtIvdw7VA4+XlhVrVWoWfvFcLmn/DXxl2pA+SDV7t1JsD
         3h6Jl9wfFL+FdydQDbogsaKPTfr12z4jU2V8uwV1xUStpeAkcoQWTEyh3VdIU86HjR5+
         Ckjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=GNoEAYQYDCnKyO2V9VlFu2leS/fO16RwHqfklA21VLU=;
        b=gSimprAh3T+tD6inhTNzmHMrA5Ic5X25E6ZU0M8aTlKl/6BraEwdicVM15u3EZqsKz
         oXZeVR8V3vARigvAGoOQLEAycpVI/8yeEC8UCEx7abopT3ZNG2Z3CnT3T/bD60M0R2rK
         Z/pxDvOy2pNtTy1UhO3MPQOIbcm+76Ffbv+xvzEaidalomNUImg50cW4habvzW9Ca/C/
         49emToYCJlNSihGpHlbz/swQMi3ndadZxjSUfpKkCRRNJfVGDevB1Yy8MdS3ihsZPgFO
         PXkv/JFK2tVXoQSivEaFPb7IpwlWXhwqX+JanSMLd97zAbQHvD1sEtnkChzfbNRdIQ7+
         BG9Q==
X-Gm-Message-State: AOAM530EG/zOv32j0eoWVt4hmsrPu1hyiHOYHvClsBHQ6fMhj9Cuntq6
        Q1beSWR1c8Wzc4jRGb23rqY=
X-Google-Smtp-Source: ABdhPJzomvCa8HP/oxbgg+rgIckjOFvR+B7Dwa6YE+q+KVGuh2jt9HmnlmNGh9c7nj90V8cEOURE9w==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr4363848wma.112.1591279207149;
        Thu, 04 Jun 2020 07:00:07 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t14sm8868365wrb.94.2020.06.04.07.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 07:00:06 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] leds-bcm6328: support second hw blinking interval
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200604135354.GJ7222@duo.ucw.cz>
Date:   Thu, 4 Jun 2020 16:00:05 +0200
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Jonas Gorski <jonas.gorski@gmail.com>, rpurdie@rpsys.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AE81CB2-8A26-43D4-AA4D-C89758E675A1@gmail.com>
References: <20200424133243.27303-1-noltari@gmail.com>
 <20200512100136.956872-1-noltari@gmail.com>
 <20200604132406.GD7222@duo.ucw.cz>
 <CE3312E5-8B8C-403D-81D6-B5C893C60586@gmail.com>
 <20200604134043.GG7222@duo.ucw.cz>
 <CA2F5175-2751-40F2-B38B-61A65C5AFD48@gmail.com>
 <20200604135354.GJ7222@duo.ucw.cz>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sorry, I had just sent v4 without it.
However, I=E2=80=99ve now sent v5 with the summary.

Best regards,
=C3=81lvaro.

> El 4 jun 2020, a las 15:53, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:
>=20
> On Thu 2020-06-04 15:43:35, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> Hi Pavel,
>>=20
>>> El 4 jun 2020, a las 15:40, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:=

>>>=20
>>> On Thu 2020-06-04 15:35:06, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>>> HI Pavel,
>>>>=20
>>>> Right now, only one hw blinking interval is supported, but up to =
two hw blinking intervals can be configured in the controller.
>>>> This patch just adds support for the second hw blinking interval.
>>>>=20
>>>> BTW, I will send v4 which should clarify that each LED can be =
configured in 4 modes:
>>>> 0: On
>>>> 1: HW Blinking (Interval 1)
>>>> 2: HW Blinking (Interval 2)
>>>> 3: Off
>>>>=20
>>>> Until now we were only using 3 modes:
>>>> 0: On
>>>> 1: HW Blinking (Interval 1)
>>>> 3: Off
>>>=20
>>> So the issue is .... there are like 5 LEDs and they can be on or off
>>> or blinking with at most 2 different intervals?
>>> 								Pavel
>>=20
>> Yes, the controller supports two different blinking delays =
(intervals), and LEDs can either be on, off or assigned to one of the =
two blinking delays.
>> However, the current upstream controller only supports one blinking =
delay. This patch just adds support for both blinking delays instead of =
just one.
>>=20
>=20
> Ok. Please put this kind of summary in comment somewhere.
>=20
> Best regards,
> 									=
Pavel
>=20
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) =
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

