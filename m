Return-Path: <linux-leds+bounces-88-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C57F451A
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 12:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCE26B20B5F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 11:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A591025761;
	Wed, 22 Nov 2023 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMVxldUC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE725758
	for <linux-leds@vger.kernel.org>; Wed, 22 Nov 2023 11:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F7AC433C9;
	Wed, 22 Nov 2023 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653581;
	bh=MyPYVBOb1JZQan55pmhKATWt/odIw2ODqt68yMlFupI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gMVxldUCSgXvsC5dn5yR/ULac2q4fOQ8SvLARrFz6fHI1Dt/iYdQXksQur2247kS4
	 qDkyVU2+CCxCurHbVypQJh7EVysKJE8HCUiYYsqrdoZnCVhRU8bjruM6tGmqxrzY+l
	 cAZVTroBV9wiJ/Cx+L5HOrbKnGt17hjtikKaUZ8PJkLvkac8cyrmv983PVMMxioCHl
	 7M9iEzE8741fjaunh1USZthHf4uR85dUpW71knb2bhJXkriNHBVw0RxCzdwDj12ByI
	 LfFXO4bIP1NPJHZblu4Brx/MW0t4uGym21fO1qtnZFhtMyO4P8arTIXxTJXt5od0ah
	 MX5spd2BcrQuQ==
From: Lee Jones <lee@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pavel Machek <pavel@ucw.cz>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>, 
 Jeremy Soller <jeremy@system76.com>, Hans de Goede <hdegoede@redhat.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20231121162359.9332-1-tiwai@suse.de>
References: <20231121162359.9332-1-tiwai@suse.de>
Subject: Re: [PATCH] leds: class: Don't expose color sysfs entry
Message-Id: <170065357900.994845.3674008624629651267.b4-ty@kernel.org>
Date: Wed, 22 Nov 2023 11:46:19 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 21 Nov 2023 17:23:59 +0100, Takashi Iwai wrote:
> The commit c7d80059b086 ("leds: class: Store the color index in struct
> led_classdev") introduced a new sysfs entry "color" that is commonly
> created for the led classdev.  Unfortunately, this conflicts with the
> "color" sysfs entry of already existing drivers such as Logitech HID
> or System76 ACPI drivers.  The driver probe fails due to the conflict,
> hence it leads to a severe regression with the missing keyboard, for
> example.
> 
> [...]

Applied, thanks!

[1/1] leds: class: Don't expose color sysfs entry
      commit: 8f2244c9af245ff72185c0473827125ee6b2d1a5

--
Lee Jones [李琼斯]


