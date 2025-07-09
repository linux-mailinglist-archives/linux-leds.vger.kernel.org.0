Return-Path: <linux-leds+bounces-5017-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2CFAFE262
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 10:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DDD87B9E3C
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 08:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706D12512D7;
	Wed,  9 Jul 2025 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2I20t/+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433742248B3;
	Wed,  9 Jul 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049106; cv=none; b=QbaomCKOQwadI2blfoG3f9bOphLz7l5SKUsRK1XO5h3gaUhqSulnf5Wiqzl+wVAhobSAql++WaoIBQQNRVoIQAxL4qVpUoL9AXNNzUVe6lDG3HnFE6z2YW8BlPouSjFcQp+iHb5vyQIQji0fXvkUn/sSG6mygWGo9wXie7LvYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049106; c=relaxed/simple;
	bh=cMT0iWqFygJbyyaHxsB4OQ2KpuWOScQHZeISearrDxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di2ormBdEyxW2aehlLj1b4Vcfiim0gF7/DYSij6SB7nzNUyQ/RHRyGaNZuPJ9T/A5owBszWVt9IZNVPNnq5isVtOAYWw+QGcuNHYIpeZOV8JL6qBRxlytULb9gFqgRBMNQYXM9f/2wqHJHT44nY30fFy5c4pXtHUw0hy9HJK+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2I20t/+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A445C4CEF6;
	Wed,  9 Jul 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049105;
	bh=cMT0iWqFygJbyyaHxsB4OQ2KpuWOScQHZeISearrDxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2I20t/+PY3Kjp0on+4VevpTc2nT0uKddf2tZzDmCkXsrug1k/iwPAB+2pd1OWd+d
	 AhRJd7DNtFHCbWE+lF0y7ckoTS97S0ocswfxtyqBQS1GHFvYiaixhY8ieHqvlKYvqa
	 E0nWLQQWoz4dcP0YS7JjsZC/m81l1kUINtD9+xuR8TLWDTFaBsd5dG3IkLHl641fm2
	 Mx2CQ+1qBAMOe1y01IQIInltbyg8Vn5yeL6H8xitdIoAZfZvOT9DoeDUElzjxW7mfU
	 2lE1XBRGhCzOSNvDKaVI4sBg7B/YwgN6b9OW2obQNHLkLMMHxarfsokar8JR1QBP+F
	 RbuJ04FxnbZyw==
Date: Wed, 9 Jul 2025 10:18:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250709-nifty-wandering-kakapo-cca8b3@krzk-bin>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk>

On Tue, Jul 08, 2025 at 03:59:46PM +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Keep the old maintainers field as is.

I don't understand this. There were no old maintainers of this binding
and driver.

Best regards,
Krzysztof


