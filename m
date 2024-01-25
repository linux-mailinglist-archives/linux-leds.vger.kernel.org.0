Return-Path: <linux-leds+bounces-683-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0483C32E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 14:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E831F26F09
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 13:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027F64F611;
	Thu, 25 Jan 2024 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2V7/h9I"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE74F60D
	for <linux-leds@vger.kernel.org>; Thu, 25 Jan 2024 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187932; cv=none; b=Bnd7tp4QV+aCupnJ5VoAA75LhK4rN8YXucoEBx8sRQBJVIQk4fvndF7rcoAlidvMUDn370qsJkyygE/4vGcA9yPwy3aZW+YkYlG+pd1nNYFLZ1jkQQNJAXU7tcgcF4dva0ZM+nZcKYZj3XCKCrmheAT5+vEp1fe/wGwZAGkcl7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187932; c=relaxed/simple;
	bh=9osc8xFRFX2J5cmiY+gDetNFilXUsDhpX0fDyDyb9Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EELB2Hl3MNUS94ZGgqMHrZcH+QCbz6njtom2MYitoFQnU296SrlkRlegt+j4G0oB19T0oerO5bFev1fg8ve81ZOSnt880aYt9tmIFGHtagzgyESFfBH29M5vmDdEwsvXYqe3QrRAzBHVlU/YvpSzZoSdkO8LREpVYb9pPWe0Yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2V7/h9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD1FC433C7;
	Thu, 25 Jan 2024 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706187932;
	bh=9osc8xFRFX2J5cmiY+gDetNFilXUsDhpX0fDyDyb9Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X2V7/h9IV4IAoW9GDYPWZhmKmrpMv8kagPl9jdILLiSN+D+3pEqhQAgQvqwWYv8ar
	 HiA22m3fz3spFBvc6lTwBB2lBE9b1q504ujAVQf2ICPzJN3HM4HakoaqLYwC6uBHXs
	 UqZC/St1xpUQvPA3PmQYiyFcXPZshhA8b2+I3NfMy036EKTi/QvhVb2IiHxo+9t4Fk
	 bBC6a/MnjtKbSfhIUPL41L0+PoTS1j83fC75b88CW23bYfqIL+O760FU3tFC2kd2Lo
	 zG9107sfBu6M54zcxyyFJyfclCqG7jNhPhYuf0dlPn2jhpK7nEtAAVXG9YAVmvlsQp
	 FMxZwsHAQigqA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <4663d2d8-660d-4af2-9f65-d95e95263923@gmail.com>
References: <4663d2d8-660d-4af2-9f65-d95e95263923@gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: audio: Set module alias for
 module auto-loading
Message-Id: <170618793116.1450777.15878912522901138947.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:05:31 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 13 Jan 2024 17:00:11 +0100, Heiner Kallweit wrote:
> This a follow-up to 5edf7f11313d ("leds: trigger: Load trigger modules
> on-demand if used as default trigger") and sets an alias for the audio
> triggers.
> 
> 

Applied, thanks!

[1/1] leds: trigger: audio: Set module alias for module auto-loading
      commit: de330a3521108011b390bd130a27b1486b9078cd

--
Lee Jones [李琼斯]


