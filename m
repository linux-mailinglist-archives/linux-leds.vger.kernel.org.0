Return-Path: <linux-leds+bounces-3739-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5FA07369
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58AF11881417
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4109E215785;
	Thu,  9 Jan 2025 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0+WUYFK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18809215782;
	Thu,  9 Jan 2025 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419056; cv=none; b=LY3y5LxQc4NWVn0Q9CzsOQDz8SY/XXR33GVRyNO41fVtz7upvWDBf6c1mfNIiCO2HoAGoepPa68e0dIJSvAXfAYGVgrndruOWnWX5QXDuwMJ/5pfQTLuBjWs3hoP3lJPx6anCWp9LB2SWXcy8lP9jX+z9zzCxflTvJztLLUZWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419056; c=relaxed/simple;
	bh=d2YFd7nm3IelQbdjqVdIVjmdS73d2aKslUFKtlNixRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eD6k4RiuPmW2qbd14SWGMYJ1DDQZ5WEtd0TvyhCRSSxsiZ0f3XosJ+9g03kvJEEOmk4HiH5toCtNkzxtokd3ct1L7D5t2J/RIS7ZQcKvQn1tr31F5Hg56Bf4m0K29pyNcOBthjWkq+/TrndzWBSRX0ENZf/Zy8EwKh4YJRtEuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0+WUYFK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD9BC4CED2;
	Thu,  9 Jan 2025 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736419055;
	bh=d2YFd7nm3IelQbdjqVdIVjmdS73d2aKslUFKtlNixRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V0+WUYFKHog8vxDqRSovEWioxWGR1pL2dbwkW1EKzN8+prYMLacyTKSNU763wk52i
	 wNrnPVLHOiOFv5iG5hUbEalJ3eab4sPke2JjvYy67btSkJIlZPEjqg6k/ReMPJ4G3X
	 5b7TJG5iQvmYSdte3db5x5NpkTh5gm6t3RO7RauEhnJ4MUcEGo2MzvABiBhWws+WcZ
	 jkiUeYIP+hHrtMLzmck3TlnJh4RQJsy/WO4QlVFabYNElpohFYzA2I1nzKMhK0gt+G
	 56Ulkhyp4kCVqn7CHawF8/xe2COPzqMU4HLDw0WhVow3q7ExNpoUk2IPtphV4j7kmR
	 SfkqnWtoeKKpg==
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 devicetree@vger.kernel.org, "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-leds@vger.kernel.org
In-Reply-To: <20241218210631.72997-1-alexander.sverdlin@siemens.com>
References: <20241218210631.72997-1-alexander.sverdlin@siemens.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: leds: Convert LP8860 into
 YAML format
Message-Id: <173641905385.2576632.11670364446467569980.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:37:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 18 Dec 2024 22:06:30 +0100, A. Sverdlin wrote:
> Convert Texas Instruments' LP8860 LED driver bindings into YAML format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: Convert LP8860 into YAML format
      commit: efd435a808d9f7c4d71822119e0ebce1b843d1a7

--
Lee Jones [李琼斯]


