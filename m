Return-Path: <linux-leds+bounces-3988-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094AA376FF
	for <lists+linux-leds@lfdr.de>; Sun, 16 Feb 2025 19:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60EEE165DC2
	for <lists+linux-leds@lfdr.de>; Sun, 16 Feb 2025 18:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3431B19E804;
	Sun, 16 Feb 2025 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="GaVK6LCa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5632C8B
	for <linux-leds@vger.kernel.org>; Sun, 16 Feb 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731804; cv=none; b=Ijqp0xNQQ4NVWNrHjdiso7uUoGOJCa7XKSze7k72wX4tgorVUKCBLcQsAT8xNSlxAwVppYYfXspu0yzTG5mW0tRrYALtEeRsiLYuQPEQw6YNzvqXRmwOd0Qs9P/OykiDd2RIXeYEOpQ1Uk78ZRmVWNOQaQoY0aDthSZWcHATH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731804; c=relaxed/simple;
	bh=0sMOYFr8lutzqCd8xDlGm4XShbFef/qPFvt/RMTnqFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkmhNTS0Flvbsrt+X94XjqZ/35302A+9g6XGM13f3PrUPLonB3D892+9vyGhbESS3wGvrydIsMYknWIvxQmr7DndeHnZl3EHK7AIS0JvnaLKl5t9weXcdmnrqRzO0t/cVaCJDK1AIGvAKocaIxcvzHGAj5QlQa0C3FW0WUA+UpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=GaVK6LCa; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 8776F240027
	for <linux-leds@vger.kernel.org>; Sun, 16 Feb 2025 19:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739731800; bh=0sMOYFr8lutzqCd8xDlGm4XShbFef/qPFvt/RMTnqFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=GaVK6LCauNE8RtiinMqme2XXU/YUdrG1T1mHORTrShsihCOz0tSqNq5hjZvclrVer
	 mDNcrf2Rc2e8WezCQrrD1jJNUZlLifWz9TXVqGID+chD6GRttte4tn+388WFi1hFjq
	 kUfSXphmGHrGTW+apf1kM9dxuBE+SW6TCK/iZ9/dZNgdI6NpYJoUQWNiF6xpE00WNw
	 uuSmS4AyOCuH0viiH6RsQEI4zlhF+2dzfk2Bo0HGRinh02kmGacxAwbFPmlw65Qf9R
	 MCosauHdUuK1Z8rnUmZZ0h50ILdN3TJ8yREJ/7RHOR0wmvdjRfHPzCMJVTGfeCBiKH
	 wfSVKOnZVEhdg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywvwl1vCqz6tw7;
	Sun, 16 Feb 2025 19:49:59 +0100 (CET)
Date: Sun, 16 Feb 2025 18:49:59 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Allow differently named multicolor
 leds
Message-ID: <Z7IzV15IVizOQxu4@probook>
References: <20250209-multi-led-v1-1-5aebccbd2db7@posteo.net>
 <20250211144300.GW1868108@google.com>
 <Z6ucAFNauWkhfYZr@probook>
 <de7fb605-527e-4c62-9b5d-947a1636c54b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de7fb605-527e-4c62-9b5d-947a1636c54b@kernel.org>

On Tue, Feb 11, 2025 at 08:10:28PM +0100, Krzysztof Kozlowski wrote:
> On 11/02/2025 19:50, J. Neuschäfer wrote:
> > On Tue, Feb 11, 2025 at 02:43:00PM +0000, Lee Jones wrote:
> >> On Sun, 09 Feb 2025, J. Neuschäfer via B4 Relay wrote:
> >>
> >>> From: "J. Neuschäfer" <j.ne@posteo.net>
> >>>
> >>> In some cases, a board may have multiple multi-leds, which can't be
> >>> distinguished by unit address. In such cases it should be possible to
> >>> name them differently, for example multi-led-a and multi-led-b.
> >>> This patch adds another node name pattern to leds-class-multicolor.yaml
> >>> to allow such names.
> >>
> >> Which H/W needs this?  Is it upstream?  Where is the doc / usage?
> > 
> > I encountered this situation while upstreaming the LANCOM NWAPP2 board,
> > which has multiple LED-group-based multicolor LEDs:
> > 
> >   https://lore.kernel.org/lkml/20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net/
> 
> Which LEDs are these?

These and a few more:

	led-power {
		label = "multicolor:power";
		compatible = "leds-group-multicolor";
		color = <LED_COLOR_ID_MULTI>;
		function = LED_FUNCTION_POWER;
		leds = <&led_power_red>, <&led_power_green>;
	};

	led-wlan-link {
		label = "multicolor:wlan-link";
		compatible = "leds-group-multicolor";
		color = <LED_COLOR_ID_MULTI>;
		function = LED_FUNCTION_WLAN;
		leds = <&led_wlan_link_red>, <&led_wlan_link_green>;
	};

According to the leds-class-multicolor.yaml binding, they should be
named "multi-led", optionally with a unit address. Unit addresses don't
make a lot of sense, as these nodes don't have (or need) a reg property.
They can't, however, have the same name, which brings me to the idea of
this patch: To allow different names that start with "multi-led-".

> I don't see multi-led there node name at all.

This was my mistake while writing the NWAPP2 devicetree.

> 
> This patch must come with user. It's fine to send the user separately,
> but please provide lore link to exact user.
> 
> Otherwise what certainty we have that this change is needed in the first
> place?

For ease of review, I'll include this patch in v2 of the NWAPP2 series,
and extend the commit message.

> 
> > 
> > Since they are based on leds-group-multicolor, they don't have a unit
> > address, but there is more than one on the same level (as direct
> > sub-nodes of the DT root node).
> 
> Which binding is this?

Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
  specifies compatible = "leds-group-multicolor", and includes:

Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
  defines node name pattern of "^multi-led(@[0-9a-f])?$"


Best regards,
J. Neuschäfer

