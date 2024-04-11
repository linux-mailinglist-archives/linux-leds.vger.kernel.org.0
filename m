Return-Path: <linux-leds+bounces-1454-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F083A8A16CA
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 16:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62651F215BC
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 14:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D84F14B09C;
	Thu, 11 Apr 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuCcwwQQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A4B149C7F
	for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844589; cv=none; b=oKNISD1kENoDANrtHYo9ijjEhpEujDC0TSQ5ewJ0AltPZ0cpciSvcVL3WJHFc1eQlNY6vpH764z+9144D1FJYUusH0zlYRWtnZEVGy7DwRaV2DNgurukJmKs6No3SDEZzn3RZUDL7KAFvaNEQx/gd9gJjh5d2XRW8KXi9MlASc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844589; c=relaxed/simple;
	bh=q+gcn6BFr7nAcBcagnbdCMSvsZLSkPfmDn18b0Je9d0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I3UXCK57BsC7h1fKRe9AvRAeZbq3dWznlnENmqWGQS3moq4DL5AbtG6kbhJXoiW53wjrrsDugmGfHkmzNQ4AfjAW4w3mEN5BUAQEL0OTqtg+zPcwWB089SK5YjqzSPx0SJQIQxFROhjjO3b3DYFK9oeJyZ8+HmWdPIODoQFUWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuCcwwQQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC128C113CD;
	Thu, 11 Apr 2024 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712844588;
	bh=q+gcn6BFr7nAcBcagnbdCMSvsZLSkPfmDn18b0Je9d0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SuCcwwQQUnxOJMoHPbB3uhBgdY5ldQ58TItY3xSuSu15I+7jJFUGQ+lA+D45AXrE2
	 jVlzOgVEbqP3OY7ZXejlpsnJTKpbRLqRtRxiYIIp94wgEli8NfjvoV8EkpI+dauME9
	 Sj7R5e016RSAB+OIupms/BpNLC2bE4TEClHli+KA/QiSP7nskLnhYSrWtc2jLXT5dl
	 5owxX0iU9ZcItpRnclC1YvJOxMIMPz9nIjKjh9bWBFI5QAQq7UGPq2P5jcrrMc96Pp
	 ludVEU2+wi9Qh4G/ipq2dIIz4J0fqeO8FynJAuzM6imdwS40hyoKMISlOTjayXEOkm
	 05bj0bhot+11Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <8dc929e7-8e14-4c85-aa28-9c5fe2620f52@gmail.com>
References: <8dc929e7-8e14-4c85-aa28-9c5fe2620f52@gmail.com>
Subject: Re: (subset) [PATCH] leds: trigger: netdev: Remove not needed call
 to led_set_brightness in deactivate
Message-Id: <171284458763.2404313.7196062951404890342.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 15:09:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 05 Apr 2024 22:53:08 +0200, Heiner Kallweit wrote:
> led_trigger_set() is the only caller of the deactivate() callback,
> and it calls led_set_brightness(LED_OFF) anyway after deactivate().
> So we can remove the call here.
> 
> 

Applied, thanks!

[1/1] leds: trigger: netdev: Remove not needed call to led_set_brightness in deactivate
      commit: b487c4e76657241197e056d06b4b73eab714f0e3

--
Lee Jones [李琼斯]


