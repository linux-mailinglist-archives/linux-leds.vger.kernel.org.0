Return-Path: <linux-leds+bounces-369-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9F811871
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D181C20844
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D1F85368;
	Wed, 13 Dec 2023 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IksyqXuK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A885358
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD42EC433C7;
	Wed, 13 Dec 2023 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482942;
	bh=0mbMyholsGay23GFxACU2veDtEPMckUAp90O2U2WGT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IksyqXuKxYsQOv/pk/e0BPsxXPWqfV+BxKrFXvsjrfArfE9Wtp71XkZqoq8GVskQO
	 LX04kdfbiXNXYglIGoj1VF8BrkHqtbM/YYE+kDxVOPkYL65Tt8LDSe4KmZwWl+W/qG
	 pyPmDBWHwRXR3Ef0i1UxdqWhtM4fdzuHbrDUOhXSQZt1ZJ0DIJT1U3Ax+aJPjrX81g
	 iU5KDuAaPdmH5eS7YvXXC9cXURt3YN2YEK6pAr0NrZE5m4K9eqlZZ2Ubbvoqyy1fDx
	 td90EwrR6DMF8vfI19LM82fbJDRVgYoX70zAqLBE+kpO/uxB+UbTLtry8XqAZHOkps
	 0nDmUHT4aJL1w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <d90f30be-f661-4db7-b0b5-d09d07a78a68@gmail.com>
References: <d90f30be-f661-4db7-b0b5-d09d07a78a68@gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: remove unused function
 led_trigger_rename_static
Message-Id: <170248294150.996477.5068464614921293448.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 15:55:41 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Fri, 08 Dec 2023 23:56:41 +0100, Heiner Kallweit wrote:
> This function was added with a8df7b1ab70b ("leds: add led_trigger_rename
> function") 11 yrs ago, but it has no users. So remove it.
> 
> 

Applied, thanks!

[1/1] leds: trigger: remove unused function led_trigger_rename_static
      commit: c82a1662d4548c454de5343b88f69b9fc82266b3

--
Lee Jones [李琼斯]


