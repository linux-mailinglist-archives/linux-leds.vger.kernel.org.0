Return-Path: <linux-leds+bounces-2042-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A19100B4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 11:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E124AB20A40
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 09:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA3C1A4F13;
	Thu, 20 Jun 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcttHybb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF72594;
	Thu, 20 Jun 2024 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876800; cv=none; b=CgnwhJFIj3e189MiB9e3n/nrmxHHpOFkcUGvBQLTKZVT5GPZphp135zd3aNBs/ItTYDuk7q//96tgUQNE5sZaNw+4j27m2mryi7RFk6oNWlwptK9hni6ISjkZIalq/p9ye9pV6fa3yAty0013wEVpez8lcv0k8i8BR/+YjBUGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876800; c=relaxed/simple;
	bh=qtrhxzMlR7VEQXRySvCqowwhZ+X8qE6LIHX+q3giQS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rKLYvG1DAPoOZ7M3mhZgjX5x+p+QW+L8UDS7AT6VBzCS+yOX4hwW8nzdyTQeVNHJRbQxmsGFiLnhaHbFF7LJkIaFP8Xj2zMlz43BFlMLTAKQ6LwiDAkX39OuR0CsQn6TUea1xmVN4qMe0G/Ku9bVxFicWLAojMjNOP70TuSB/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcttHybb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43019C2BD10;
	Thu, 20 Jun 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718876799;
	bh=qtrhxzMlR7VEQXRySvCqowwhZ+X8qE6LIHX+q3giQS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DcttHybbq13De9ntRHA9t4BtwllmfyP3riJ+eRzd8GphTobfg/C86uu88BSgEiMBL
	 80afvXffY/SEvJQJHjZ2urAsEfUiETI4IrlPAVKoF9y8DA4L0s8BU18lYfwzGK0a2e
	 KpnuzXd5+bCfSuSt43QgeCHfl5utsVImU8lB95jcwaJRJYBl2+M1m4hUhHnfZ6YEbl
	 0CibpEPvGV+XCJ0ntW0Ed+aAgMnDIGpdYARWgF5gwpMoJyhCcqLu6k8iEzDEOz2w6t
	 ecrQWcPZ9HGVy52hK3D+mhsrmUtJ7CJFp+Br+Ow9jQQCA2MkcAwxZOp+gLKEMVEJiO
	 nWBWTJxaLXYBg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, regressions@lists.linux.dev, 
 linux-leds@vger.kernel.org, Genes Lists <lists@sapience.com>, 
 =?utf-8?q?Johannes_W=C3=BCller?= <johanneswueller@gmail.com>, 
 stable@vger.kernel.org
In-Reply-To: <20240607101847.23037-1-hdegoede@redhat.com>
References: <20240607101847.23037-1-hdegoede@redhat.com>
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
Message-Id: <171887679701.1126294.11039062848140573919.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 07 Jun 2024 12:18:47 +0200, Hans de Goede wrote:
> Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
> hw_control trigger the default trigger") causes ledtrig-netdev to get
> set as default trigger on various network LEDs.
> 
> This causes users to hit a pre-existing AB-BA deadlock issue in
> ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
> resulting in hung tasks in kernels >= 6.9.
> 
> [...]

Applied, thanks!

[1/1] leds: class: Revert: "If no default trigger is given, make hw_control trigger the default trigger"
      commit: 3acc45f2ceb0609812522e45aec4cb9516e1c586

--
Lee Jones [李琼斯]


