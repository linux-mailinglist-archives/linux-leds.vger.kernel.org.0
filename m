Return-Path: <linux-leds+bounces-62-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4947F3200
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 16:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6B5AB20FA2
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 15:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62C751C4C;
	Tue, 21 Nov 2023 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpMwRnzf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCB48793
	for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D743C433C8;
	Tue, 21 Nov 2023 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700579414;
	bh=hoD9B9KaMcEvoeSUYddyjpm2ZdhkXr+vFTrOHMCpHEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QpMwRnzf/CUaKy/Zs1u5MsOJr9UiZ4YZjf6yB078nlcpbnvgjGWnZBVs6FF2Kq2xW
	 Ka+Kn/ebwt9mbV2o63YB5z78cP4yuVULoS8W4VAW85UrJNxJPUYgrH0NrSWL/92k6N
	 5teoA+r2UeqOb+OwPCze4+tLg3zrrGSgUfQfGbk0vy0jw0rbY8YXi6aaMcyRaj5UjB
	 l+5gu9PYHyxW8ZEjp5unPrapmcdYF9RdXHomMRaFOIE+bRHBCbpacnv8szqis7BLi6
	 gfxGuMiSjxgj81UlfKk9mNivd028LicpDhEwAQ4HdRwwQXiC0Y28GzqXLOivwzhBxz
	 GT9IrKq3pwB8A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 =?utf-8?q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>, 
 Jeremy Soller <jeremy@system76.com>, Hans de Goede <hdegoede@redhat.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20231121142629.27083-1-tiwai@suse.de>
References: <20231121142629.27083-1-tiwai@suse.de>
Subject: Re: [PATCH] Revert "leds: class: Store the color index in struct
 led_classdev"
Message-Id: <170057941222.880794.5199112193553712244.b4-ty@kernel.org>
Date: Tue, 21 Nov 2023 15:10:12 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 21 Nov 2023 15:26:29 +0100, Takashi Iwai wrote:
> This reverts commit c7d80059b086c4986cd994a1973ec7a5d75f8eea.
> 
> The commit caused regressions to a few drivers (such as Logitech
> keyboard or System76 ACPI) that already had "color" leds sysfs entry;
> now they conflict with the commonly created sysfs of led class.
> 
> For addressing the regression, we revert the commit, so that the
> conflicting "color" sysfs entry is removed.
> 
> [...]

Applied, thanks!

[1/1] Revert "leds: class: Store the color index in struct led_classdev"
      commit: 17e1ad377bb1d39260e0594ee284d8e03f64fdfb

--
Lee Jones [李琼斯]


