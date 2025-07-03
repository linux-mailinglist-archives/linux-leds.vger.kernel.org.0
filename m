Return-Path: <linux-leds+bounces-4975-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C818BAF6B97
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68664481E4A
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 07:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32CA227BB5;
	Thu,  3 Jul 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FB0PFlQ4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9B2DE6FC;
	Thu,  3 Jul 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527958; cv=none; b=iZ5fFAY0rOWOC8YQiIbF2Xn1EPsZO9ZTWIHctr3XsusY5cpZHNmM/O8LyfWCD5dvMOS88QsUsWU9t1LheuWdT27NedMPknPucnjXwDeIy9GPAdR8ErB3NUz5nFuwoubpK+f26f18wxrDGEYIOEGR35InZy/+BQ8hLNBcWgt04Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527958; c=relaxed/simple;
	bh=BNjh7SDj90SVwYeC3gHweQPSa84FkJJVfTboO/TLVq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SulxTcqjISIkj6pLJOM3KMxF4Y8ZNKrxLLhiXXUQ2pKpDkHTihPV4ZCVoVqa+/yZRHF3bBV1Pum2pO7vruhvE9HyRKukcXwyJlARyrF+IVOMgbCAL7zzmLv6OkJzEDa02DksD8A+QA6nptQAXcIfWUS2psZqXhvdJ489GVPq9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FB0PFlQ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D875C4CEE3;
	Thu,  3 Jul 2025 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751527958;
	bh=BNjh7SDj90SVwYeC3gHweQPSa84FkJJVfTboO/TLVq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FB0PFlQ48nhA5GqWEQCiTudnftCbuT9eysNO4W2iQwl9RtRifDy2jXs8XLdhCaemB
	 3nRB3xgsGR5nv06N1UOyT35rf1zLs4Y0yJem6+Bw68zKG4zxT1mT3cH3kCLZiJJMiq
	 enm1ydHMeWdFP0aYH3HwtSGwvBVgTR694IVkq+Xqsx/0eZ45OGRCJwZWeJk38GsCPi
	 oZDiBRZInMEecIcABjvNmyJskZ2IF1bONnPAf66CgtONAZ9flAtclb60yu70mkYa5Z
	 gC1E1/qiCYTuaLI0rqJHfEUCuwXwyXgC1As5UXYY3qS4lV+zxli57842u9PapmExWc
	 bFh4BVcTk0DKg==
Date: Thu, 3 Jul 2025 09:32:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: vendor-prefixes: Add Princeton
 Technology Corp
Message-ID: <20250703-truthful-warm-bobcat-b03e55@krzk-bin>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-5-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250629130002.49842-5-jefflessard3@gmail.com>

On Sun, Jun 29, 2025 at 08:59:53AM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> Assign vendor prefix "princeton", based on their domain name.

princeton.com gives me consultants, although I expected known
university, so same questions or problem in commit msg as in other
cases.

Best regards,
Krzysztof


