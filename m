Return-Path: <linux-leds+bounces-337-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF880D02A
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 16:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72FE6B208F6
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 15:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB1C4BAB9;
	Mon, 11 Dec 2023 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2HZArik"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0FFDC;
	Mon, 11 Dec 2023 07:57:20 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so43836715e9.0;
        Mon, 11 Dec 2023 07:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702310239; x=1702915039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I3eqhGtTOHL63O+C3jkv4nmquOhc8pni4ZLLJlVFIo8=;
        b=c2HZArikJBv4JzO7htW+VDjjur0h0SmCzHM7ok6zSjxUXxhWC31eVa+uviuu3FRahC
         EDWgy9P+3LwumlYrgjIOeTDBsBEJdP8BwkeBzRGpjMtZ04/mr120wk34TGKNVtU2fQT3
         4Jt7EInxN5MupZIMWcpsM0+6fafbSHHuITQGLcOLolxoA0Lkqtm6ffMri/S30WcpkWIl
         pvAadt7HLifodojsettn6QjhMaQXkACOpW+jIGiMQiAYu7MZfyLevoEHhk6y9jDpqBfN
         0oJLmiZ/QXqrD/t/jdDPCyVBm4/AvTHZZ0Nye7bMumoCZWHoygxgweNxh8SNgk0TohV8
         Z12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310239; x=1702915039;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3eqhGtTOHL63O+C3jkv4nmquOhc8pni4ZLLJlVFIo8=;
        b=GUOTh10R7OK1fP7utN+KcrTRvYhCk0LIShUlX4I9V0U/FjVhPPytltRiE+/VEl06Zd
         83o0syFQzQoUvjrJSTpR03vlR7uuBPI9ZVX7ZijH3mcp37Hy7pvg8arz99Z5KBrpxqem
         GKiV38cVzD5ecPCYg70Q+Zu73GN9hSY6cg0n+b0GdNhy/IX0xGo1B5IQNEw7aBnUnCG1
         axT6c34mEWd632Ur4EQwbQFw+eRgA7kLsn2bgxUAg+xj0joozHP2XN0ESVwR70ZSWTcY
         dsFqrk4Fl+YIHl82DQrTwWQf3KLuOrBpCMXXjCWj/VUNAX7AVNorxZS2lmQCeA7UWCjc
         3izA==
X-Gm-Message-State: AOJu0Yz1lO+9ytobV1EpNjjxfQ3X+0LyqJQ02X3rhXRLHbwOGPOmz1lo
	1waujhosl0AWr9Qc8lJuYZc=
X-Google-Smtp-Source: AGHT+IF2KuUpho9nXjniuWZ9w3PAw54PSGrOL3zgIMkmIZ6uxAoqLISUUsrpGxrGzT8ff+M6aoZqTA==
X-Received: by 2002:a05:600c:4285:b0:40c:1df2:c9a2 with SMTP id v5-20020a05600c428500b0040c1df2c9a2mr2379876wmc.126.1702310238557;
        Mon, 11 Dec 2023 07:57:18 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c0a0e00b0040b3867a297sm13563402wmp.36.2023.12.11.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:57:18 -0800 (PST)
Message-ID: <6577315e.050a0220.50f30.0122@mx.google.com>
X-Google-Original-Message-ID: <ZXcxW3OVWklKtJ5A@Ansuel-xps.>
Date: Mon, 11 Dec 2023 16:57:15 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
 <170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170142826116.3357002.9561246405642038358.b4-ty@kernel.org>

On Fri, Dec 01, 2023 at 10:57:41AM +0000, Lee Jones wrote:
> On Tue, 28 Nov 2023 04:00:10 +0000, Daniel Golle wrote:
> > Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] leds: trigger: netdev: extend speeds up to 10G
>       commit: bc8e1da69a68d9871773b657d18400a7941cbdef
> [2/2] docs: ABI: sysfs-class-led-trigger-netdev: add new modes and entry
>       commit: f07894d3b384344c43be1bcf61ef8e2fded0efe5
>

Hi, Lee

I'm working on adding LEDs support for qca8081 PHY. This PHY supports
2500 link speed.

Is it possible to have an immutable branch for this series so we can
have this in net-next? 

Jakub can you also help with this?

-- 
	Ansuel

