Return-Path: <linux-leds+bounces-5592-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6DB9F11D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 14:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716A61C20793
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 12:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4F52FD1A1;
	Thu, 25 Sep 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8xPglZd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13682E92B7;
	Thu, 25 Sep 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801705; cv=none; b=HlrS6jHJudlcxwIfrYGPxewioWsm2cSpZaCq5ns2QAWz8eReRpZvbLAAIiLXWzYztCc6d4E5TTctCiL2EGquKOsT51A7xhzz56W4SfHCUSOusH6D+V92TP13FZOIbmFWvObS2I2PyJVodTdySzAVh8WXb/eFVDaJLJ4Bs38Ta8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801705; c=relaxed/simple;
	bh=KVBSsx3zG+9oHXw8ykeoYx25CILJlG9dLnmDbP/MwC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r+c83J3c1wcyH8cNQIQViFTx12C3jEG4O9Iz+l8tegYkqciXEEnqUfxaoRL/SbthVW7px+rNg4mJsW0LOx/faSKBjOOTXBcDVYlMk+8uH/fg+c83ZjOt2A27fAiSkuMamCaFTq9oilbpyqGVAh+L0SDEgqsbRPBbWN6CM8z7X3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8xPglZd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66982C4CEF0;
	Thu, 25 Sep 2025 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758801705;
	bh=KVBSsx3zG+9oHXw8ykeoYx25CILJlG9dLnmDbP/MwC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K8xPglZd2isfoAM7Z0hTemICYkyuwHX02jU7VmGNxzJMSsf3I94k814v/KhcwXlA4
	 WI2fAv2zHpKLrTS00lbGK+yzWXhUsQMj9tjqKjhTeBYcJhuP5H9EGg3o1JK1HqTIEO
	 z/L8MPqF00A1l3W/T97BznRISIvI8FRQIYNRo8xCr5xRLPBFgA9h2LRhyXQ0clQHad
	 eOrsypzWre+iG92gsN4358fZWw3okJvTJd5uQTHGknvAylFLKxLv+aEau+Gm9dwx4T
	 9iCiXQS7WJIfbR4PHQELOpCcofGqULc3Eesz/tBacBxINkJL8uipbZYORTM/9En8Bs
	 ht16KaokhvjOw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250916-ams-txt-to-dt-schema-v2-1-6a9db6fb7ea3@thegoodpenguin.co.uk>
References: <20250916-ams-txt-to-dt-schema-v2-1-6a9db6fb7ea3@thegoodpenguin.co.uk>
Subject: Re: (subset) [PATCH v2] dt-bindings: leds: as3645: Convert to DT
 schema
Message-Id: <175880170312.635867.8330256260241303611.b4-ty@kernel.org>
Date: Thu, 25 Sep 2025 13:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Tue, 16 Sep 2025 16:11:01 +0100, Harrison Carter wrote:
> Convert the ams,as3645a.txt to DT Schema format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: as3645: Convert to DT schema
      commit: 64826db1e2e177b58dcbc7cf1e1379527be2185a

--
Lee Jones [李琼斯]


