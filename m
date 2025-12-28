Return-Path: <linux-leds+bounces-6477-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50599CE56DC
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 21:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA8263007ECA
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 20:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D592280024;
	Sun, 28 Dec 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfD+zc0Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDCA24397A;
	Sun, 28 Dec 2025 20:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766952206; cv=none; b=gnO7vXBL/Ni2Ht0cyO29E9yE50TBkfax3EZlNnYpJCch3JauGBdCePx/KbQ9JEUIRs1DGzau4qluw400Zkg2zQxr6dB3JeRlxtUk2Mnz9CO61NwxNxKYeTtvNQIyXnfgYgz3Pp6mraQxZVb0MQMu0l66OXAOhjkQc+gvbk7M/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766952206; c=relaxed/simple;
	bh=fv+ApKFw4PdI2rUGcp4PkvG+omFm7kWaVklPvZYXQPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/hciR6qjwlifv49cug1aVbM1cyTQd6euuvcgffE2/j3dJtvS0mJ7tX4vxLg6RBj/34bmoA0pqEdqYGm8yTTWZTPzEfKV3CtF+xIrcJtGfDvLjr40CbAOEjJQNpHDafLU6xkG0ae4yz12g4hdMM4a8RLrfodgxfGpVWCse3wSnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfD+zc0Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766952205; x=1798488205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fv+ApKFw4PdI2rUGcp4PkvG+omFm7kWaVklPvZYXQPQ=;
  b=WfD+zc0Zz95JAVA7oEiV5Dprvc+g0WiXzqMbsRC2mp/Fh8inV8hZxx7r
   zh4IvwbOT/+40C3sgN9DCmLZ1L+NCCWbaowkFiRm+3sCOFDL3hLkCoiIt
   YRZjRHepyDY3PRm96au4xHXZW5zPDfK+gYlYatAlQtiscTaoO/79evQFz
   hNjtzFjxf+UV7a595dlzahGk1DT24IcJmJRr5F6LePN+cS2jyfFsdrYzu
   7UK2tISuOmJQrIkMYzSOKc4cDcdSyugTVuGacaNsIYw1kXNZZ52YuQ0vJ
   ZWkSYxSaDCEcTRv0TmPekpq+O3sMZcbJu+m6wYpVqsrXaptupuPUxejw7
   g==;
X-CSE-ConnectionGUID: Ps35crTfTb+fOeBrSDD4KA==
X-CSE-MsgGUID: 8esl0MtsQWmp8RfSQBgJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="86004961"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="86004961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 12:03:24 -0800
X-CSE-ConnectionGUID: Ns2ygDZMTL+M73gbSS31gQ==
X-CSE-MsgGUID: G0V5BFxBQ4m6AD/sLLU/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="231435972"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 12:03:22 -0800
Date: Sun, 28 Dec 2025 22:03:19 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <Professor_jonny@hotmail.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Message-ID: <aVGNB4QlzbYdqb4A@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <aVF3ZTxqSXWVcCVN@smile.fi.intel.com>
 <DS0PR84MB3746809655135654882AF9D39FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR84MB3746809655135654882AF9D39FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 28, 2025 at 07:14:09PM +0000, Jonathan Brophy wrote:
> >Hmm... I think the research missed the udev + sysfs approach as done for the
> 
> >networking devices. Hence the question: do we have enough data in sysfs for
> 
> >leds to understand their HW connections / semantics?

...

> **What we'd need for udev to work:**
> 
> We'd need to expose something like:
> š /sys/class/leds/lan:green_23/dt_path -> /leds/led-port23
> š /sys/class/leds/lan:green_23/hardware_id
> 
> But this has problems:
> 1. Not all platforms use DT (ACPI systems)

Ah, forgot to comment on this. ACPI incorporates the way of key=value
properties in the similar way DT does. So it's not a good point.

> 2. Adds complexity to LED core for every driver
> 3. Requires userspace policy to parse and create symlinks

This is what udev is for.

> 4. Still depends on non-deterministic suffix

Same as #3.

So, this leaves us only #2. Which is a weak argument in my opinion.

> The instance identifier solves this with much less effort.

But as I already replied, your approach is also okay to me.

-- 
With Best Regards,
Andy Shevchenko



