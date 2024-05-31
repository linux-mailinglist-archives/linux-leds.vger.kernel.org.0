Return-Path: <linux-leds+bounces-1776-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 784688D6629
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343A628C81C
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5465381A;
	Fri, 31 May 2024 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bhmnq8I5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6224A0E
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171107; cv=none; b=AF60tPgVUh/KvQB9/tLP/5QwqeeGkXv0Zu8ybWDJ+rBP7TIL3Z3tcloutsVV2EIvBzTRNcZRpno7RaqcnnTcvDZoXdd5XgmaWfJACyBDPk4slinv7Eq/gidYo8XjhaI1Hnfssz0q73iKkddzCI0SF0EwNUw0Bs4LJArb5xhnWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171107; c=relaxed/simple;
	bh=nawHY22Aatsar3ss/xkKc2RtAbr1Mp9ZgKSxYW9xFbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=laJD1OOPUYTbk3cpeLZ7S/V4S8P81ocXM6Wf+oMFlQh7YPe6DC3eNlt9BGiaPCY4c2m4SqVmUjhl/64pF9sOkvVXJZYrjrr+FVB1LyP1A2VKqdfbnlkpFlm/94bE8zocYC/bFZO6DUZ1B8hgEhBTsbfRlgQaCqSGDFVe9T34TqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bhmnq8I5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D84C116B1;
	Fri, 31 May 2024 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171105;
	bh=nawHY22Aatsar3ss/xkKc2RtAbr1Mp9ZgKSxYW9xFbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bhmnq8I5UJXgL0l8sPJOUSZlAKCT7N0YDtmovK7HqnpTyLaIvZmn6RhaqC/cKwEkA
	 TM3fCwqJg44z4gew7mQzIrlS3f0aLCbcnVaXwHU9fE629TH5DwjjUpQdKxr4Z62cTW
	 hMFVAGVRfcjZ3nc2j8UkEyMFExpecwnN/ldMEF2kS8Gupe5am22JWUXIFWW+rFYOlp
	 lt/7pxyyb5ESPILArFncARB8aWlPs9Fm6Nt4ppxwN81cBqMMuSqO3ZrdmnjTWYXG0l
	 uabRw8TdaXbMMlCPsDe/L+d9Q4Hsqu6g9WHYGYiByAhl3BhRCIH1AGd9jY8/rQvHRj
	 p/BYy5UlmEOGw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: Kate Hsuan <hpa@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 linux-leds@vger.kernel.org
In-Reply-To: <20240531135910.168965-2-hdegoede@redhat.com>
References: <20240531135910.168965-1-hdegoede@redhat.com>
 <20240531135910.168965-2-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH v3 1/1] leds: trigger: Add new LED Input
 events trigger
Message-Id: <171717110429.1175266.9012358446012019190.b4-ty@kernel.org>
Date: Fri, 31 May 2024 16:58:24 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 31 May 2024 15:59:10 +0200, Hans de Goede wrote:
> Add a new trigger which turns LEDs on when there is input
> (/dev/input/event*) activity and turns them back off again after there has
> been no activity for 5 seconds.
> 
> This is primarily intended to control LED devices which are a backlight for
> capacitive touch-buttons, such as e.g. the menu / home / back buttons found
> on the bottom bezel of many somewhat older smartphones and tablets.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: Add new LED Input events trigger
      commit: 005408af25d5550e1bd22a18bf371651969c17ee

--
Lee Jones [李琼斯]


