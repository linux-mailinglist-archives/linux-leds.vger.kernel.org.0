Return-Path: <linux-leds+bounces-689-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4183C3C2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 14:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6F61C23DAC
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 13:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D80656B75;
	Thu, 25 Jan 2024 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9aJmDU4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22C56B70
	for <linux-leds@vger.kernel.org>; Thu, 25 Jan 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189695; cv=none; b=eToz5hzo5enkqGcZ3zG3+9+wvgUrCrtbt5TqZPOf6tTXfAjEWL3lW8zwbS48x16+cuV0s0ozTqvry55j10LrqA89M4dFdyBUuUmk14UwTPp6l1gzdjhtD5QYKRwA1BZ0pFyYwhhDJoNAnSWCFk2NoVSUnsrkrl/iM0ZaN7x1/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189695; c=relaxed/simple;
	bh=+ggGKmdSKIdil0cIH9UDvQ3QAOpoE/tAJBXJvCRS5Oc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f3TdO9/kpPf0tnHcqFusTuz6BN4c8YX+PioVOIHPh91Jq4wNoDSb+SWK0e51UwcVuuQO5x48wLvC2MHcKQEC0GnQsEVR4W99P+FwcmgwJIEfxiSxZ2Nik4IGwETEawXit3aAdpLbhNV48aAnxlY7L6rFvocy8zVbMJB5IS+83+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9aJmDU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA40BC433F1;
	Thu, 25 Jan 2024 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706189694;
	bh=+ggGKmdSKIdil0cIH9UDvQ3QAOpoE/tAJBXJvCRS5Oc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S9aJmDU4hovZXxSkA6XqmtLRTkG5ZZxMOV9NdPrtQ0gnIBV2xIxNyzrNY8Hnl70YG
	 EJrD967RJFxCiDFinNGhU+mgpIrEFmZuRcpIxLzjhc9a6KmmJVesRNpWPME5XjKAPM
	 upn20KKj7knOE0S/uGHsIov7ZIkAHMMWVHwZWS5Jq382kzPnGiQ0X9DuI6Z8p7/i+I
	 be/9eEG3VjNmvMEh3JT2p9dczpJYna01YZshX6WtPmANgb2Bjq2l6OAPCgCnep/E+3
	 ZYflCQ6X8GRfiveOOOv954K8bR2xk9+5zage+xtclgIY0X++BxSl0/kfDvkLGF4WlW
	 UuS4DhbLqEL6g==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
References: <84c0fa67-2f03-4474-aa75-914d65d88dd0@gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: panic: simplify
 led_trigger_set_panic
Message-Id: <170618969339.1467009.16893486596600124077.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:34:53 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 09 Dec 2023 23:54:51 +0100, Heiner Kallweit wrote:
> I don't see why we iterate over all triggers to find the panic trigger.
> We *are* the panic trigger. Therefore we also know that the panic
> trigger doesn't have an activate() hook. So we can simplify the code
> significantly.
> 
> 

Applied, thanks!

[1/1] leds: trigger: panic: simplify led_trigger_set_panic
      commit: 682e98564ffb67989a77002844767318d366a9ee

--
Lee Jones [李琼斯]


