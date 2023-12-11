Return-Path: <linux-leds+bounces-339-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B380DD98
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 22:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835AB1F214EB
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 21:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363A54FAE;
	Mon, 11 Dec 2023 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQylh1TB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71F59D;
	Mon, 11 Dec 2023 13:54:00 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c31f18274so44047075e9.0;
        Mon, 11 Dec 2023 13:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702331639; x=1702936439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8n4tBwejFKfzA6wdFqtQmCcFFvMbFa29Lz+m8MX1IQ=;
        b=KQylh1TBdRlOw61ykgRcFsbMUAUwyp+EeuGlMdHdT+2BvQbRJAEWOwUk0a0mcTnzSI
         dQqQBhQN9UJ4g3glZWCO3aGHPybN3b1oZPVASZMHVxDMl4PTZMwebzR08m17SJidO4YK
         d/XzYlz/K3nJVKjeQvMPP9NWugm1gNBKxv/5YMZ0S2BXL9xAQHOOvtwi/50fhcIi8jSt
         0SRjUS7tZKbRAs6qNgRhfXnjhhdQEghOwFeKcDHbokB7lD6Vd2/kjaV57onSGN1aIgGT
         morEM02+21Hs2oVibWMpUuIYEC7JabStLeTG3+WofNl+p479A+eP9lAwEsQvFJd3L9mv
         FFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331639; x=1702936439;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8n4tBwejFKfzA6wdFqtQmCcFFvMbFa29Lz+m8MX1IQ=;
        b=sBRQAFsoyX3fN/hBnBfKW0VXB9JtSg6jBlBcF65gzD2EZdtobLhI6NxVzHVSQqLtco
         VXQuvhhZXate157MBy62PKlD0F8bj5/h6zAAxW41hHWZOGW7t74KA7Q7WHXGt4N2FIVI
         o/uWiHHPkDybBpcHdKVElzxO4AuehwSjc0JrRn/HM+ISC46FaWeORiGysxEU9ehjxwxu
         mIs0/PkT8c1e+OC5cTKccHl3FYLsC4NtVxM7RgpsxzbTwhz8HNcAdOdf8CVUMM+3u/mY
         4h9JVKlP59VRcewAKoT7lPLamkP7yDShysYZYqhTdYmAaWJwE8KTdzjQJ/aKa/gps87l
         izgg==
X-Gm-Message-State: AOJu0Yx1RRjjD21jS+U9LkBqhgPeysuYuHUuV4AC608aYKs66yVQA001
	F+6EEqMwL2SRYKxDcLkCdS4=
X-Google-Smtp-Source: AGHT+IEKsGJx2YhiJwXS45HaTQxGxG0YjckMggpfPPgtR+T4gxDpkWGa8VFaBWxtZx2lRoAduDX0hQ==
X-Received: by 2002:a7b:c84e:0:b0:40b:5e4a:40c5 with SMTP id c14-20020a7bc84e000000b0040b5e4a40c5mr2526124wml.229.1702331638809;
        Mon, 11 Dec 2023 13:53:58 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5709000000b003332aa97101sm9405602wrv.38.2023.12.11.13.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 13:53:58 -0800 (PST)
Message-ID: <657784f6.5d0a0220.617b5.20ee@mx.google.com>
X-Google-Original-Message-ID: <ZXeE8ynse07EVqBl@Ansuel-xps.>
Date: Mon, 11 Dec 2023 22:53:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Andrew Lunn <andrew@lunn.ch>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
 <170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
 <6577315e.050a0220.50f30.0122@mx.google.com>
 <20231211084656.26578d89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211084656.26578d89@kernel.org>

On Mon, Dec 11, 2023 at 08:46:56AM -0800, Jakub Kicinski wrote:
> On Mon, 11 Dec 2023 16:57:15 +0100 Christian Marangi wrote:
> > > [1/2] leds: trigger: netdev: extend speeds up to 10G
> > >       commit: bc8e1da69a68d9871773b657d18400a7941cbdef
> > > [2/2] docs: ABI: sysfs-class-led-trigger-netdev: add new modes and entry
> > >       commit: f07894d3b384344c43be1bcf61ef8e2fded0efe5
> > >  
> > 
> > Hi, Lee
> > 
> > I'm working on adding LEDs support for qca8081 PHY. This PHY supports
> > 2500 link speed.
> > 
> > Is it possible to have an immutable branch for this series so we can
> > have this in net-next? 
> > 
> > Jakub can you also help with this?
> 
> I'm guessing that if it's already applied - it's already applied.
>

Soo that it's problematic to also have on net-next? (Sorry for the
stupid question)

> Lee, we seem to be getting quite a few LEDs/netdev patches - do you
> reckon we should ask Konstantin for a separate repo to which we can
> both apply, and then merge that into our respective trees? Because
> stacking the changes on stable branches may get weird and/or error
> prone. Or is separate tree an overkill at this stage? IDK..

-- 
	Ansuel

