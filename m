Return-Path: <linux-leds+bounces-787-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC084E074
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 13:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841B128B988
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A996571B24;
	Thu,  8 Feb 2024 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bekaWJJy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514A6F53C
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707394318; cv=none; b=N5lE1LKwtc1onfyXzLS9NYWbuaLRR5cZ8JDEvSFxTjpAEtaezcnmWDiBq+6JAB9/O1ZDxjl0/w4BiUFyGxXcQfUdjZii3OlckHwWqB3T+lLd5c1i9CRnn6r2oOJ7wwaS80IQI+UrzOCW8Rubtx6gvXSDyTLWgT/CV1YLiI1OTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707394318; c=relaxed/simple;
	bh=hq3g4dmASb+SACf28IV8FaoPocpLVPySAEKhzGOfUz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqqw414cxObR9Powuwro1Slf+vv+KSI503Tdkp69kXNbGfUInYEWQcPLfEruDIOXNU75tUFRjrvJ3QdrbkYaSbpyPAkRhhv+EifqEwafWMuvqYlep4uApJ+aZ6x3MwcHTOvnnG38NecKmYHWOL7CFu3qPigo0xinelHqMTCyQz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bekaWJJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3EAC433F1;
	Thu,  8 Feb 2024 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707394318;
	bh=hq3g4dmASb+SACf28IV8FaoPocpLVPySAEKhzGOfUz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bekaWJJy6VbdihN8S8I6k1NmVfjLXSCpIKDGlt1t0eL9L7xpB2EdBa5gxOk+veQ/t
	 +UO8FLuRheBrHofq+qsFZbi2qjlwL3PgWiv5cz8ucBz2gId8PvZaLNMnGYlfkIT45I
	 9F7sutj/HOM1w3iFELGopcQyLyh3fdgAbhvqDL7zAe/NJha8O5kX+mF6wRXF3A2ZNu
	 kNWqLf0xCJ08HDRVWrqYk/PDv+lR+Hy2h0vqW/Z54c6AvvEwxFziWKe8vFRhyBIe/z
	 hOukvIdghPwCR/tPfiPE0Kk/0eh+Z28xv5/T95ItfHu6IM+/d6YIjYJ2YLBoZd9N6H
	 mER0lT74ZpipQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Stefan Kalscheuer <stefan@stklcode.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Christian Mauderer <oss@c-mauderer.de>
In-Reply-To: <20240204150726.29783-1-stefan@stklcode.de>
References: <20240204150726.29783-1-stefan@stklcode.de>
Subject: Re: (subset) [PATCH] leds: spi-byte: use
 devm_led_classdev_register_ext()
Message-Id: <170739431679.967285.1503078851260366155.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 12:11:56 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sun, 04 Feb 2024 16:07:26 +0100, Stefan Kalscheuer wrote:
> Use extended classdev registration to generate generic device names from
> color and function enums instead of reading only the label from the
> device tree.
> 
> 

Applied, thanks!

[1/1] leds: spi-byte: use devm_led_classdev_register_ext()
      commit: dba9f8d45ca355a5d8a52bb5b74cd8abc824001d

--
Lee Jones [李琼斯]


