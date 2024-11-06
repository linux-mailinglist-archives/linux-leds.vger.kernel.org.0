Return-Path: <linux-leds+bounces-3302-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E79BE13B
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ADA81C228EF
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363B71CF2A6;
	Wed,  6 Nov 2024 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cffeO5Co"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6C1917CD;
	Wed,  6 Nov 2024 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882597; cv=none; b=a1CzW5HIg0JYVmwJlGDcbGj0OIhPC2HBfmd/QCiKZBFGrMs7Vg9TWeLdXqMk5u3Yts3CDmh2HTx+iUv7nO5ibp5f15/d1FtXYk1NKv0wj5d4juXSB1sVLJV1ABbRkk6X2tEejusfBKYDLf6l6jIzAf8YdhEIZuhR6Kj+eS8atJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882597; c=relaxed/simple;
	bh=Rup2aixvNpnWoIPpedHVLtUBROMP081uHzovoGc4zQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B9KMMANIhPImvd9msPDYOszqXXFLJk6Lb8KWvPKlFTzU3A/r5ZioMxhOI+ZF63NOCxnnv/TJRnCqSh7YCkEWPztzLQVyH7x0Hb9LSbCm33RDOylxi7soFy0DBCSge81jNSRpNNk8xMM3Q4z147VwiwT6ijI0ZztwVkwfHXvRIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cffeO5Co; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2DFC4CED3;
	Wed,  6 Nov 2024 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882596;
	bh=Rup2aixvNpnWoIPpedHVLtUBROMP081uHzovoGc4zQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cffeO5CoV1o8hWTxbMlQCMenmky756cApenbZHXV+EEJytYPWVujagkRUzdLY5kmX
	 orVSnAhOxrJwN17fNo8J6pnJDR3P1g1FV+rbytBdOvyeLm/TRrf6ipSKeuM5ACwFvs
	 Y7TdjdcR98D5V+j9D0nHnXKL7mBpZsKZfaka97PnXApccnVtCAKhxv5kNdLHwYfPFN
	 pXyy8cTcZnvMn12jc5FNDnowdUUghhr/QD/dnTTYaA9zIP+64Wilpip3qCLw5Z6Mu0
	 bZWsYyp792R9rG+WPTCv6SRrOwoJOn8SmVr4LIDcZndJUDp+Wt7CMj5x3vFLhIw+NU
	 ezOJVDpaK2RbQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241103160527.82487-1-quic_mojha@quicinc.com>
References: <20241103160527.82487-1-quic_mojha@quicinc.com>
Subject: Re: (subset) [PATCH v3] leds: class: Protect brightness_show()
 with led_cdev->led_access mutex
Message-Id: <173088259527.3252516.9517506943760955780.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 08:43:15 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 03 Nov 2024 21:35:27 +0530, Mukesh Ojha wrote:
> There is NULL pointer issue observed if from Process A where hid device
> being added which results in adding a led_cdev addition and later a
> another call to access of led_cdev attribute from Process B can result
> in NULL pointer issue.
> 
> Use mutex led_cdev->led_access to protect access to led->cdev and its
> attribute inside brightness_show() and max_brightness_show() and also
> update the comment for mutex that it should be used to protect the led
> class device fields.
> 
> [...]

Applied, thanks!

[1/1] leds: class: Protect brightness_show() with led_cdev->led_access mutex
      commit: 4ca7cd938725a4050dcd62ae9472e931d603118d

--
Lee Jones [李琼斯]


