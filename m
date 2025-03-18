Return-Path: <linux-leds+bounces-4318-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66673A679C6
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 17:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7D281645BC
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977C1210192;
	Tue, 18 Mar 2025 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZeyWipRT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E618EFD1
	for <linux-leds@vger.kernel.org>; Tue, 18 Mar 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315967; cv=none; b=jC+LD4C8WhecJTSZMb3SN/NuParLr0RbYY8CfczV/+EApQj3i0KM/KUJZqAw0q0wrDr5q5EmTLTlSh+UcQhKAo8YiwYrySPXXE9+4xRB4y/u4VyDCIawTCaGA0dGMQRu4RoeKtGkrs6nqlCGGybEr19f0ECD2TKf0nMtE47w+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315967; c=relaxed/simple;
	bh=Y4GaTWIXYkP1Wp5MBq5OZrPIS2IaOnZYMEx/7ruy0Uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3HQ2PJzaA776fznZEa3h8s5O1Nj2sgyjRmaPox2b62++yjmeFGbaR++hiv1hRS21f/cyIQMliTlbfggEC8QYjdWtXlD8kZpF54NBlgncBWH3K869+igGrt8FZtiXxtAKTRNEO+oNHZIiydw+pfnurE7XM6WNPXIyD0Pq1s03DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZeyWipRT; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f6c90b51c3so62553237b3.2
        for <linux-leds@vger.kernel.org>; Tue, 18 Mar 2025 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1742315964; x=1742920764; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+wKjasBMPgoT2rFalGXd6BBeR4y99deeJSGyhMPOVds=;
        b=ZeyWipRTOMMHiBnMG5fyKu0ZRk0PBQ4+3Lagmd7GXN12bybZAtmGbC37GUJ/7a8fxA
         lwfFnRVeJCCF2ySDCOI47oamb2UoIuOyxyr+507eGNFowKb6B9yETGUksEq7+9Jl4MsD
         rtSSYEneu8bU6rZpt0D9HoDU517hmqMscq/dVz7/w+LyUbrked8rCfnIFZ4Fx5HobJBu
         AZirtrGki2vljwwUtJzAuHBr66VIEFRpg6y+cAEvvwimiu0yMgdSw07G6BO/kQ3S8AsH
         Oxv4ua10PzDqziKNxPvMFgW33wAKawUCGmAmnmzZhLhAz6z0pdk39deSnzC73syfZmv1
         aqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315964; x=1742920764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wKjasBMPgoT2rFalGXd6BBeR4y99deeJSGyhMPOVds=;
        b=GT1ViSnRuyQ2X1YAwLmeiWz54AeXa9ucyMyy5b1t5Mv94vxSa9npcTDF7zhdMsjfFN
         4lhjwqeijOROR3vi4mn/T7hB3rX+/BK6Mqd8+8oW+ZUTXz9HrU5obr8VFjht/KaKfAaN
         k39x807axHbKy+6qNfHyFSIhpxHAeV+s9JSTA14nOdQ40CI14sdf9wI2loi9A91w2E2R
         uagDqc//fKRX7w607hC/Ds5YToykNW7bUJHnO9xE6LymNmnvt5XfHD90RGek3f7BldnR
         9jzxINpUDt615CWym4IfCstQDxsJVcTAtp2T9m5Em++4fIwe6b8Ztij4oteIN2d+ccDy
         krzA==
X-Forwarded-Encrypted: i=1; AJvYcCWfhS8W7D0EOnp3o7pqYqyeGWQZ0loMX+38tln46wz3242/5vmovW5uKQoKnlEYAlb7s4nSPRNKPb6M@vger.kernel.org
X-Gm-Message-State: AOJu0YyUN3husRj106ZE7os1iVzVxaYXSXUmK8SixTctkxXoxDg0Ja3L
	NYe0JdkhCGtSOHy0aPabUy33AYkiOalUWKSx/JBfHgHWYIE9PvCiBDP5PdpFwe0y7vHkdT60DDQ
	F2u627d++1K8ygNJ7cxVCEyRuFkGcLU+nQGTJ9w==
X-Gm-Gg: ASbGncv+8AhPbjAENXMEytyZwLa95W5U+XyT74so8xRjx/muFxxLn5dx7bSLmtlxh3a
	ekUpoKoPKeGWUQkxh//RvIZMU4nXqb669k6yfoi2Tzfk+4W4+OTNXw7i9hio2ZXPfkskPJhR4GZ
	3Y9BCRt8LLFxcZulqJ5to+kw/+0SwMeBRPD/CUIXmzS9AOiSN78zD76Xds
X-Google-Smtp-Source: AGHT+IEAIuZBtCdDszWtXzHCJJeW4LXwXcjtps3dupT+KLXpxevhe4+sxD9wCYgo8/fgc4cU/MpsDqaQ6wQ3z5JY1Gg=
X-Received: by 2002:a05:690c:4902:b0:6ef:4a57:fc98 with SMTP id
 00721157ae682-6ff45fa0641mr217311797b3.16.1742315964086; Tue, 18 Mar 2025
 09:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
 <Z9P01zU_Kg0U62wa@kekkonen.localdomain> <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain> <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
 <Z9l04b5ZGy877j32@kekkonen.localdomain> <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>
 <Z9l9-tEwHRtXnz1a@kekkonen.localdomain> <s76b7q2cvcuk32n3jpsijyrhxhtstk6fewb5drkxdeopvt5grj@p4mcqltiza36>
 <Z9mNKG07sJcbnk3Z@kekkonen.localdomain>
In-Reply-To: <Z9mNKG07sJcbnk3Z@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 18 Mar 2025 16:39:05 +0000
X-Gm-Features: AQ5f1JpzPvC5kCimBdTH6JyyA_xL5QWl48RuiHB061pvN72a0BBg78Q-tkCMXUk
Message-ID: <CAPY8ntDzA+j97XB4VUfBtSH0RgpVKSdKxS1o5LnmoNDE1h=eyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe duration
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Richard Leitner <richard.leitner@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 18 Mar 2025 at 15:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Richard,
>
> On Tue, Mar 18, 2025 at 03:46:18PM +0100, Richard Leitner wrote:
> > On Tue, Mar 18, 2025 at 02:06:50PM +0000, Sakari Ailus wrote:
> > > Hi Richard,
> > >
> > > On Tue, Mar 18, 2025 at 02:42:53PM +0100, Richard Leitner wrote:
> > > > On Tue, Mar 18, 2025 at 01:28:01PM +0000, Sakari Ailus wrote:
> > > > > Hi Richard,
> > > > >
> > > > > On Fri, Mar 14, 2025 at 05:08:16PM +0100, Richard Leitner wrote:
> > > > > > Hi Sakari,
> > > > > >
> > > > > > On Fri, Mar 14, 2025 at 01:34:07PM +0000, Sakari Ailus wrote:
> > > > > > > Hi Richard,
> > > > > > >
> > > > > > > On Fri, Mar 14, 2025 at 11:25:09AM +0100, Richard Leitner wrote:
> > > > > > > > On Fri, Mar 14, 2025 at 09:20:23AM +0000, Sakari Ailus wrote:
> > > > > > [...]
> > > > > > > > > On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> > > > > > > > > > Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> > > > > > > > > > flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> > > > > > > > > > control, as the timeout defines a limit after which the flash is
> > > > > > > > > > "forcefully" turned off again.
> > > > > > > > > >
> > > > > > > > > > On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> > > > > > > > > > of the flash/strobe pulse
> > > > > > > > >
> > > > > > > > > What's the actual difference between the two? To me they appear the same,
> > > > > > > > > just expressed in a different way.
> > > > > > > >
> > > > > > > > According to FLASH_TIMEOUT documentation:
> > > > > > > >
> > > > > > > >   Hardware timeout for flash. The flash strobe is stopped after this
> > > > > > > >   period of time has passed from the start of the strobe. [1]
> > > > > > > >
> > > > > > > > This is a little bit unspecific, but as also discussed with Dave [2]
> > > > > > > > according to the documentation of V4L2_FLASH_FAULT_TIMEOUT it seems to
> > > > > > > > be targeted at providing a "real timeout" control, not settings the
> > > > > > > > desired duration:
> > > > > > > >
> > > > > > > >   The flash strobe was still on when the timeout set by the user
> > > > > > > >   --- V4L2_CID_FLASH_TIMEOUT control --- has expired. Not all flash
> > > > > > > >   controllers may set this in all such conditions. [1]
> > > > > > > >
> > > > > > > > If I understood that wrong, I'm also happy to use FLASH_TIMEOUT for this
> > > > > > > > use-case. But tbh I think FLASH_DURATION would be more specific.
> > > > > > > >
> > > > > > > > As this still seems unclear: Should the documentation be
> > > > > > > > changed/rewritten if we stick with the FLASH_DURATION approach?
> > > > > > > >
> > > > > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> > > > > > > > [2] https://lore.kernel.org/lkml/CAPY8ntB8i4OyUWAL8k899yUd5QsRifJXiOfWXKceGQ7TNZ4OUw@mail.gmail.com/
> > > > > > >
> > > > > > > Right, I think I can see what you're after.
> > > > > > >
> > > > > > > How does the sensor determine when to start the strobe, i.e. on which frame
> > > > > > > and which part of the exposure of that frame?
> > > > > >
> > > > > > In general I think it's not part of V4L2_CID_FLASH_DURATION to take any
> > > > > > assumptions on that, as that's sensor/flash specific IMHO.
> > > > > >
> > > > > > In case of the ov9282 sensor driver (which is also part of this series)
> > > > > > the strobe is started synchronously with the exposure on each frame
> > > > > > start.
> > > > > > Being even more specific on the ov9292, the sensor also offers the
> > > > > > possibility to shift that strobe start in in either direction using a
> > > > > > register. Implementing this "flash shift" (as it's called in the sensors
> > > > > > datasheet) is currently under test on my side. I will likely send a
> > > > > > series for that in the coming weeks.
> > > > >
> > > > > Ok, so you get a single frame exposed with a flash when you start
> > > > > streaming, is that correct?
> > > >
> > > > Correct. The flash is switched on for the configured duration at every
> > > > frame exposure (the sensor has a global shutter) as long as the camera is
> > > > streaming.
> > > >
> > > > Maybe to following visualization of configured flash and exposure times help:
> > > >
> > > >              _________        _________        _________
> > > > exposure: __|         |______|         |______|         |__
> > > >
> > > >              __               __               __
> > > > flash:    __|  |_____________|  |_____________|  |_________
> > > >             ^^^^
> > > >       strobe_duration
> > >
> > > That diagram would work for global shutter but not for the much, much more
> > > common rolling shutter operation. Does the driver use the sensor in rolling
> > > shutter mode? This isn't very common with LED flashes.
> >
> > The ov9282 driver uses the sensor in global shutter mode.
> >
> > I totally agree with your statement. This pattern is only useful for
> > global shutter operation.
>
> I think (nearly?) all supported sensors use a rolling shutter.

You've got at least two other global shutter sensors supported in
mainline - Omnivision ov7251 and Sony imx296.
Patches have been posted for OnSemi ar0144 (Laurent) and ar0234
(Dongcheng), which are also both global shutter sensors.

So yes they are in the minority, but not that uncommon.

  Dave



> Could you include a comment on this to the driver?
>
> I wonder what Laurent thinks.
>
> --
> Kind regards,
>
> Sakari Ailus

