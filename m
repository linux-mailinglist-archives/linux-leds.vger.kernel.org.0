Return-Path: <linux-leds+bounces-2543-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46B965963
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 10:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6820B223FB
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 08:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879A6166F00;
	Fri, 30 Aug 2024 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvu6RmOY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B971531CC;
	Fri, 30 Aug 2024 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005146; cv=none; b=Z4Q6E/sI1ZwEMKF0SmuswhLTzCffnZYl8qccyt02HqkY8EYW06siMQNFaOwyDMYqEmDlMLfoJ/G51tFQ++G6DwIWKyZsfTbuIGUOPZa1H+XHOAvestZQr8ILD2Sk4WuOTwWeolrKTM42hydwHcdI/ZpI9lesvJJJ5+i5n8vehgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005146; c=relaxed/simple;
	bh=P9oH7G5QPQG9f/M028v/kTviBQCSKLZjYtPUCQxtXug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=em9EgAcq49VJ5R7cys0muQpJ2IgoWs+JglHSsw59XH3X618jTFyBxMlSqfnJiwuMgvnv0IX651rBziEapLWRvPn61/Y72F4BmG5sLFZVGAaduTBzcN4zu1efYyucHR1Rx0TQNf1zp8aFCnW+kYPRXVtFTWc9zQECVJNWTOIL+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvu6RmOY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B036BC4CEC2;
	Fri, 30 Aug 2024 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725005145;
	bh=P9oH7G5QPQG9f/M028v/kTviBQCSKLZjYtPUCQxtXug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uvu6RmOYA43qaK/75NJ32BtluDhgJoVmNnUBBYzcBvY5P1SRaf+AlqibeJPIgvt8j
	 jCQ2y0Mnmuv/NehngqyrrL7qE9r9nj39rgmNOpAX91ulvigR1Hrdz8HT0v78hsdree
	 pf0Xm6MzhoY8FHBwkqLPLpJFV3mSGVdxsdXmwhYG6rcFYmCwUMEqjPIaHhPdTBkh8C
	 B7YUnPbBcAN4J1hQukmi4SAZZLuXUxGB3aN+DdABtvuauwElpav2h4ORnF5RiAmPZW
	 UD3WG+DEmSQGZ9ZyV+WAX98KbN90GAgIbsP1kLWNRX30mbwCHzeH71mWpekdkRx17B
	 Eog7jFlP7j2AA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liao Chen <liaochen4@huawei.com>
Cc: kabel@kernel.org, pavel@ucw.cz, lee@kernel.org
In-Reply-To: <20240827122431.430818-1-liaochen4@huawei.com>
References: <20240827122431.430818-1-liaochen4@huawei.com>
Subject: Re: (subset) [PATCH -next] leds: turris-omnia: fix module
 autoloading
Message-Id: <172500514446.76594.11921169215009219557.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 09:05:44 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 27 Aug 2024 12:24:31 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> 

Applied, thanks!

[1/1] leds: turris-omnia: fix module autoloading
      commit: 64c38866500b0bda4363fb994d545557dffb017c

--
Lee Jones [李琼斯]


