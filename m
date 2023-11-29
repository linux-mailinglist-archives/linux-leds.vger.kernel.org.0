Return-Path: <linux-leds+bounces-201-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06027FE254
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 22:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90CB1B209C4
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95B960EF6;
	Wed, 29 Nov 2023 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxWmbGqK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFB19A;
	Wed, 29 Nov 2023 13:50:15 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-35aa6107e9fso372285ab.0;
        Wed, 29 Nov 2023 13:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701294615; x=1701899415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbQ5NefzltYUPy1o8ufNnSbjtnJIggsw/UqQG6B5axM=;
        b=RxWmbGqK0ngqBWCV85GKZkdgflFHxV9TA6MzL4CJj0Ai9lDgvGWS8zfUR59W/+ZKF3
         PJCbqjW0MYXVJqA2lECMV+nKC6xsW46UDYlM6zqyn6dDnQ74ZgSIhpaSiuOBv/p5YROu
         m4mNfV7SOV/v6pxkgkgWWnm2nN7/9ryF5nQ0YZY1NHgJesYIktEc78R29/bPMSuuRGgo
         osn9XKzCWWAehcrVtEQixXFX7oCNU6sSLg664DToJ6YLJRZfPRqMPvI01TpOA18uJz8z
         xmDJBfFGjTiI6fwAafwwbwgOprPiT3F5/8w5PlEGJ9pnKnZsmdYInqlSlMgR1mWltBGs
         jA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701294615; x=1701899415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbQ5NefzltYUPy1o8ufNnSbjtnJIggsw/UqQG6B5axM=;
        b=N2Nq7s0XpECwrVw1FyywwgHzvNucN+LE7A7/KILGY/KHTjBKinQMcVilE+8IvCQmRq
         LoOT80c5uag9QOk0b+RKXzoRi16h14PhGhtCUhJEoJLrCxz2afzCS08VnCDLi7ERXi2V
         nB0TieTIx0UdRyIJ1PYq+CJ7gaytJ864YfCCZ7gZiwpHVYXEG6aCC85LJdX35tVLbWLd
         AyLPY3bxoL5wcqxpYwx/ANlnAzvoe/kplP61zjesvd5xrC2TOtNkM2FPdRWU5jrInW0/
         78pEUys7fy6LihHeYV3Xm/lIk/9rkNNNiXHClgu+smUtPJDlunxzvlhTswzFPomAyE8O
         5A7w==
X-Gm-Message-State: AOJu0Yzo82gCxP63G6RqiMC/zzDY285QZSMvpIOfN6u+Qxnpy9d+/U9p
	J582DU2cfLNzcA2r04Ieg10XJJ68X1yqBV0rf8w=
X-Google-Smtp-Source: AGHT+IF30V6G4GwzpvoxEIoV3/jdEPHOsYdgmv/1z3/SR0znziDufDsk1Hh9qUknxYbOZv8J6P0gGyC52urWFrkCSJQ=
X-Received: by 2002:a92:cd8c:0:b0:35c:c47d:f57c with SMTP id
 r12-20020a92cd8c000000b0035cc47df57cmr14631346ilb.20.1701294615112; Wed, 29
 Nov 2023 13:50:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com> <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
In-Reply-To: <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed, 29 Nov 2023 22:50:05 +0100
Message-ID: <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 5:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 29, 2023 at 11:41:51AM +0100, Heiner Kallweit wrote:
> > The current codes uses the sw_control path in set_baseline_state() when
> > called from netdev_trig_activate() even if we're hw-controlled. This
> > may result in errors when led_set_brightness() is called because we may
> > not have set_brightness led ops (if hw doesn't support setting a LED
> > to ON).
>
> Not having software on/off control of the LED is a problem. It breaks
> the whole concept of offloading/accelerating. If we cannot control the
> LED, there is nothing to accelerate. What do we do when the user
> selects a configuration which is not supported by the hardware? The
> API is not atomic, you cannot set multiple things at once. So the user
> might be trying to get from one offloadable configuration to another
> offloadable configuration, but needs to go via an configuration which
> is not offloadable. Do we return -EOPNOTSUPP?
>
The point you raise with the non-atomic API is completely valid,
however I think it's
not directly related to this patch. Here it's about a validated hw-control =
path.
So I think the patch is still valid.

> Before we accept patches like this, we need to discuss the concept of
> how we support LEDs which cannot be controlled in software.
>
RTL8168 LED control allows to switch between different hw triggers. I
was under the
assumption that this is not uncommon.
In order to deal with the non-atomic issue we have to set
trigger_data->mode to the
resulting new mode, based on what the user set. Question is what we show to=
 the
user. If we show nothing, then he will expect the new mode to be active.
If we show an error, then he may assume that his input had no effect.
So we may have to show technically an OK, plus a message that his input has=
 been
stored, but is not supported by hw.








>     Andrew

Heiner

