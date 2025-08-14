Return-Path: <linux-leds+bounces-5223-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17945B27098
	for <lists+linux-leds@lfdr.de>; Thu, 14 Aug 2025 23:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFEB5E4152
	for <lists+linux-leds@lfdr.de>; Thu, 14 Aug 2025 21:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6232749E0;
	Thu, 14 Aug 2025 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3mLTxc+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA83597B;
	Thu, 14 Aug 2025 21:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755205945; cv=none; b=hZDtR7n2AnjGlfbi7FpY0yachuJyjgb9QU5DCDRdSXdOj8e7vV+5U4lxl0p7AJ/WQO1qlhVutfReLT7sjTF70753wlWCBJNvGEjrNhV4JxUsYLQyjV5VTFasuGcTTzrWClurT1kLL9bmgGcM+7yCvPsDJg+XGBG88HvjzBoUeuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755205945; c=relaxed/simple;
	bh=7QZaE8oo44a3hYjhoB1A0+u5s3r77l5Hwj7B/t3szLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gI2hew+I39wGklJMzYhfesKtcCFlRklPfKdlbv6LxmxSmJ/Z8PQ6UU1ex6ItYxcuuXRx7gkRFfrd0JSz1xsNjY/7KI8LVL7GdH7lngxZCJcpkqDpMpkpeaPmUYY6/uV2XCiF2twlBqwj7oNAi5QzEp9eODwzE+FWdhNpXgxCCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3mLTxc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E66C4CEED;
	Thu, 14 Aug 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205945;
	bh=7QZaE8oo44a3hYjhoB1A0+u5s3r77l5Hwj7B/t3szLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3mLTxc+L9jdNvAx1uNjhvCnXnxHRXoLi4oXzEKAX1Zjeb/2hu6ak9EYXz0ZDuNCL
	 IPCWug3YsskWSP8BExrDXNMqvx10RoXWwx8G/kD6AWBO807cxSxWGcS6mNExHT6SPD
	 /mWfkISKdgA4R0CSHV/yNcZXKbMpKJYH1fnnhUdqIR4BwLaxi8+yOrY9TisUpnsJZ8
	 noXprwMZsi92ZzJr4sbrMIDtt7AB2ETQ4SfcIZFioD6xIHk/hgOcL0+0IFjpt+mKIm
	 gEX+2PqY+ejS26Kwr2sr9pzaWlxorbQYankCmkyb98c+4eiR57guKi1SY5qcGKWayz
	 Q7lonV8WfQQIQ==
Date: Thu, 14 Aug 2025 16:12:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, Li Jun <jun.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
Message-ID: <175520594376.3919024.11270343433080389857.robh@kernel.org>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
 <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>


On Mon, 11 Aug 2025 15:54:03 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


