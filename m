Return-Path: <linux-leds+bounces-6589-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E28D060EE
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 21:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A12713031A17
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 20:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E0232BF5B;
	Thu,  8 Jan 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALXoTppO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423E32252D;
	Thu,  8 Jan 2026 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767904149; cv=none; b=uwdP5AU2niBbN6DjOuFOHtfsOato33rzcxQIdJYvZFIqoagLBU6CXmf0oCf/rYCfJn/gH+FtV3wOsqa2xpxi6BPUUWjjm0m7KFuYMpdgKSXmQgZiLz0dDZuMJ65uQEFIruIBUu6Z6xJjK7GbmUV8Y72etuYOlPd1RmTEmaQYqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767904149; c=relaxed/simple;
	bh=J5zgVl3LofNAIZuTJWaMznkSwxB14toCZtKNTVHOZsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1GhSLfHjeMZYNH9cMWJnhWhsZtnG3qHtWCBzdDH7hTva+xYHs8aNSVPLu0ZNJRlYglNQ9jBoiUXb3UjKbzqImKkFo86jqs8tO+eWW0fqefLlq05cWPE2L9y8CVgpwDBXY/NJK8iKx1dBmIQd9nyi93F2TwrsuXqeCOChkAizM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALXoTppO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E57C116C6;
	Thu,  8 Jan 2026 20:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767904148;
	bh=J5zgVl3LofNAIZuTJWaMznkSwxB14toCZtKNTVHOZsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALXoTppOivts3pFHK9soFhROljIcDOP2H3TLu65MzlQVXcBqjj4DuhcCWw4gyzMxk
	 n1g5ZtGVqvvphzyBvzMJ1OUuPdgB/ZpYIX2wxrlO82+nXoltyU2FS8ZJKw6Tu691n9
	 OvMkaP6qUIhcH3uNKHXPm97+jKagMpLC+8hjOlXsyG+snjxr+RWcJcyf6Ch+uM3bTM
	 ctx3Q35oB0ffEuzYyiSuK1D3K2+ZDVPoQYGxALu4x/TRK0jRyyOn7mt2ZMfOffL6Os
	 RBZdGJZdATwahMxFsekknJEKQ+Cy1H8S2nIHzFQB8cC4ZN5Bk6wBKS685BU/IALrXJ
	 u6Vag8ErB5Qvw==
Date: Thu, 8 Jan 2026 14:29:07 -0600
From: Rob Herring <robh@kernel.org>
To: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, geert+renesas@glider.be,
	Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
	shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
	krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
	corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
	linux@roeck-us.net, jdelvare@suse.com, goran.medic@sartura.hr,
	luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v9 1/7] dt-bindings: Add IEI vendor prefix and IEI
 WT61P803 PUZZLE driver bindings
Message-ID: <20260108202907.GA998297-robh@kernel.org>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-2-luka.kovacic@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824124438.14519-2-luka.kovacic@sartura.hr>

On Tue, Aug 24, 2021 at 02:44:32PM +0200, Luka Kovacic wrote:
> Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 39 +++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml

I found this and applied it (with a couple of fixes for current checks). 

I guess working on the driver is abandoned, but we already have this 
binding in use in armada-8040-puzzle-m801.dts. So it's either add the 
schema or remove the nodes to fix the warnings.

Or maybe the whole platform is not used and the entire .dts file can be 
removed?

Rob

