Return-Path: <linux-leds+bounces-6471-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF2CE55AF
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5FB300980F
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F93B21B9C5;
	Sun, 28 Dec 2025 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kN6ukOhZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086019F48D;
	Sun, 28 Dec 2025 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946669; cv=none; b=KMiG9yaqH9qWJd8EpeC1MS4o1B3o3OC8Rky0MLTpIJaWqTYWSVowId5m1RqYCXowEAbh/ieo1Xz0ZH867BHA8A+nM1rj73Bbn2bj7yOA78FqPkR0DABaSBqzTE4LcxICQAKh1ErwIy7XfOvKmPTB4lSz1Kr2ThnpCc6chRrV0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946669; c=relaxed/simple;
	bh=4B6vz/E98nO/rBf7bgxjs44K9mAIJORWzwZ2gzFGS28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nzm+ICDEILLLS4YDIqTYW42w4TFOvv3j/u1CeMHVq+OlV72yDWqWgXbfGfo3lj3RILkKntUpU+9H59924AnAAKHwRG9ivUh8MrVM8/qxbGY/2YhTPjcrbO5adUGXmSpQ6fVVRxTqsGQEo5QxexFGj9bgBXRoWKnqMxu8IUJoCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kN6ukOhZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766946667; x=1798482667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4B6vz/E98nO/rBf7bgxjs44K9mAIJORWzwZ2gzFGS28=;
  b=kN6ukOhZp0l9jLaNwmovXNsh4Zvkd7x/ZVoeK3jflK3w50tcHwtMdfkg
   eTQE2YoQXHl3W8E7i34jKw9dTrx5EILXH31aWyRB0Dowbm3rnsMCUdv7G
   LhZRIZzEZypxLv1ifGq2L3DEnLKdCeM+EVBs7p4jVlxDfIo4jAyh4l1rb
   bJrej92rI5iV8jX5O/ilSCu+3WxbSyrtw85K9/B2yCoTRv80HUp5dcMLs
   9nf25aw237/M1JNPbGeAEkke+NtJe0NGeQ3qAVxfGBDVaPXUuLaY4UIFn
   sYH5iHknauQotd8Z4wH4QoKvFO5/pafR29Ju456+BPP5is62NKhyY/3RF
   Q==;
X-CSE-ConnectionGUID: 65l4tsVyQyOlK/7zpKR6Eg==
X-CSE-MsgGUID: FBP6/hE0Qk2y/iqSqdmGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72206144"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="72206144"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:31:06 -0800
X-CSE-ConnectionGUID: aGKbfh2PSC+hOgCiM24Qpg==
X-CSE-MsgGUID: Bq0yvOvMRka9P8+c7qxsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205239858"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 10:31:03 -0800
Date: Sun, 28 Dec 2025 20:31:01 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Message-ID: <aVF3ZTxqSXWVcCVN@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228182252.1550173-1-professorjonny98@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 07:22:43AM +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This patch series introduces an optional "led-instance" device tree property
> to address non-deterministic LED naming when multiple LEDs share the same
> function and color.
> 
> Currently, the LED core appends numerical suffixes (_1, _2, etc.) based on
> registration order when duplicate function:color combinations exist. This
> creates several problems:
> 
> 1. **Non-deterministic naming**: Registration order determines suffix values,
>    which can change across boots due to probe ordering, async initialization,
>    or module load order.
> 
> 2. **Non-semantic identifiers**: Names like "lan:green_23" provide no
>    indication of which physical LED or subsystem they represent.
> 
> 3. **Breaks userspace automation**: Network management tools, LED control
>    daemons, and hardware monitoring cannot reliably identify LEDs.
> 
> 4. **Ambiguous numbering**: "lan:green_23" could be mistaken for LAN port 23
>    when it may actually be the 23rd registered LED of any port.
> 
> 5. **Namespace pollution**: The alternative of adding vendor-specific function
>    names (LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...) pollutes the
>    function namespace. The instance identifier keeps standard functions clean
>    while allowing contextual differentiation.
> 
> 6. **Breaks naming convention**: The _1, _2 suffix was intended only as a
>    collision avoidance workaround, but has become the de facto standard for
>    hardware with multiple identical LEDs.
> 
> **Example: 48-port network switch**
> 
> Current behavior (non-deterministic):
>   /sys/class/leds/lan:green      ← Port 0? Unknown
>   /sys/class/leds/lan:green_1    ← Could be any port
>   /sys/class/leds/lan:green_2    ← Could be any port
>   ...
>   /sys/class/leds/lan:green_47   ← Could be port 1 due to probe order
> 
> Proposed behavior (deterministic):
>   /sys/class/leds/lan:green:port0   ← Always port 0
>   /sys/class/leds/lan:green:port1   ← Always port 1
>   /sys/class/leds/lan:green:port2   ← Always port 2
>   ...
>   /sys/class/leds/lan:green:port47  ← Always port 47
> 
> **Example: Multi-domain power indicators**
> 
> Current behavior (non-deterministic):
>   /sys/class/leds/power:red      ← Which power source?
>   /sys/class/leds/power:red_1    ← Which power source?
>   /sys/class/leds/power:red_2    ← Which power source?
> 
> Proposed behavior (deterministic):
>   /sys/class/leds/power:red:mains    ← Mains power indicator
>   /sys/class/leds/power:red:battery  ← Battery power indicator
>   /sys/class/leds/power:red:usb      ← USB power indicator
> 
> **Design principles:**
> 
> - Backward compatible: Instance identifier is optional
> - Extends existing convention: function:color becomes function:color:instance
> - Follows kernel precedent: Similar to eth0/eth1, gpio0/gpio1 naming patterns
> - Ignored with deprecated "label" property: Avoids conflicts with legacy code
> 
> **Alternative solutions considered:**
> 
> 1. function-enumerator: Only supports numbers (0, 1, 2), producing names like
>    "lan:green-0" which are still non-semantic. The 48-port switch needs "port0"
>    to match physical port labels.
> 
> 2. Deprecated "label" property: Being actively removed from LED bindings. New
>    code should not rely on deprecated APIs.
> 
> 3. Different function names: LED_FUNCTION_LAN_PORT0, LED_FUNCTION_LAN_PORT1...
>    This pollutes the function namespace with hardware-specific combinations.

> This RFC seeks feedback on:
> - Property naming: "led-instance" vs "led-subsystem" vs "led-context"
> - Implementation approach
> - Additional use cases to document

Hmm... I think the research missed the udev + sysfs approach as done for the
networking devices. Hence the question: do we have enough data in sysfs for
leds to understand their HW connections / semantics?

-- 
With Best Regards,
Andy Shevchenko



