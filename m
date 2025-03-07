Return-Path: <linux-leds+bounces-4195-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77324A56C19
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 16:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E691784C7
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 15:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B037121ABC5;
	Fri,  7 Mar 2025 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FX/Uo705"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E262E822;
	Fri,  7 Mar 2025 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741361482; cv=none; b=g/xfmHBhbb+ZeNxPRj0kVvLTMTS+WrUPmcOwZgsX8gWv6VZyX62rx962uKE5roLsSICmEw61J5S+ON6c4WBKOGYrdz6d5vjFwXxgJkr6jFnlhpajXoo5lwO3oZzZBb7TP0uPqy4cjGzvhKk0pwJoeyI464wYAPzLMar05sNWPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741361482; c=relaxed/simple;
	bh=H5GDKBF4WLZyxB6cshmVVqYPGkXPjpE6lL9tSzNVWmM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aHPRa+8HomRyccelslrI858CHMaV7V4tvAUX5fOqagQoAJ6foNWspXWMJfotravMKjghK/MsedLpVs1gTdCVbP0JmWZQPg0MlX0H759PkeFIcAwdavun7atUTXQZmr7Ifwqp22G/82FDR74rNwaNc+UH2gULIbbSWs1i9ZP94lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FX/Uo705; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54B6C4CED1;
	Fri,  7 Mar 2025 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361482;
	bh=H5GDKBF4WLZyxB6cshmVVqYPGkXPjpE6lL9tSzNVWmM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FX/Uo705WovbbiPNFzdRsbpxWl/Vvnj4R6yCHyhtKbaeB0hH2DMj8mYt//Y0+B+1L
	 0gcoQCC3yQVqtIFPwa5RHl1ovaI9QpTeiQY2bEb7mjyH9kxhc4oAWdofr6qHAS2cfh
	 be3CACLMEaV5D5oOMKwcC6UnP4IY/kU6c5rE87zge85W6uOm2kLVFTD0eblOXd4GbS
	 5rQggH0sa3Mok21r2FS4YS3eTMNghxBUxqeYXO0UuDJBVwbTl4HuyDib8q4L8DOKvk
	 +7gSwFzbTOhSmCSjpnmgejhQogxM3C1S3w+bujJB6xavQgeLSMXrd2dYZTEiZ1HRXO
	 /PyiASXtF5mNQ==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 0/3] leds-st1202 improvements
Message-Id: <174136148124.1086011.15222104053418170899.b4-ty@kernel.org>
Date: Fri, 07 Mar 2025 07:31:21 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 26 Feb 2025 17:04:40 +0000, Manuel Fombuena wrote:
> Following the feedback received on the set of patches for leds-st1202 that
> I sent previously, I am sending separately for your consideration those
> that are not fixes with an improved cover letter that hopefully is more
> aligned with the guidelines.
> 
> [PATCH 1/3] leds: leds-st1202: initialize hardware before DT node
> 
> [...]

Applied, thanks!

[1/3] leds: leds-st1202: initialize hardware before DT node child operations
      commit: 8a2727615f9865b69998b3162a76a20c46f97866
[2/3] leds: leds-st1202: spacing and proofreading editing
      commit: 2aa76efbbe375be31e0a4db88ef52b4a85c0038e
[3/3] leds: Kconfig: leds-st1202: add select for required LEDS_TRIGGER_PATTERN
      commit: d884bb02e14e39e9f269b50b349c37caec001bec

--
Lee Jones [李琼斯]


