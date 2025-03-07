Return-Path: <linux-leds+bounces-4186-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C78A55D3B
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 02:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51D818947BC
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 01:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C069A1519BC;
	Fri,  7 Mar 2025 01:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="GPICIKXj"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE9DDA9
	for <linux-leds@vger.kernel.org>; Fri,  7 Mar 2025 01:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741311751; cv=pass; b=NDgJRx0nM9ht70ic73Ru+pJNN/bqKD+ZrDVuCJkR+FvuIY4FjTFLO1ManqHPFh9Y2J9FEYZEiJW9REqf8yg5uUlIrJG1m6UF8HYOAGmfXupT6aucjVgtSVZgPjb144hJzjE7H6ZMu3HJV/NjTGo/7TUm6AiZJNfd7/UGNzMx7+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741311751; c=relaxed/simple;
	bh=Tf4Shnjj3U/zmDicIpP+wZYQl4ZOWXyxsfVB19Y/s04=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Rf5Hb5Z43wvhSxSVYer0Tz44dfudwZZsJPsiUu0kKQQ+HHIUBUiAHstue4/U8WrDZDBasJUA1NGZ3iWk0Vni6fdWMRofM0cKp++wFmEtgXZj8luxY2TcmDWDObii6Hgl6F36/RfVC1kKTLc6BDIdG5tUBtFgxI5fGdl+9f3h00M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=GPICIKXj; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741311745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dPpazXnF7LI1tRKYjkugHvPOTbsdbeBW5/pe6OzCFSZiQHEenpKWXuEDAEP6brNXHzVyeZsiMPv10OBfn70AqnyLNn9yGi0FdrA9TqgC9Y8fge3A0K+UcWaSlTPcJalo60IWGBp9VgzVE7Nq8euNh8m3GGcjh/bOemSjDmWjDhM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741311745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y/4aq+eMYnO5loJ4iQMRDJJDIqAqKXKJt5ry6PiqAfI=; 
	b=EotGDtkKwkqv7cpz0dfV7gPIWcbWh/A/lfDLQ/sGEo7Fxg0Kdm7yTzoeKQOgAY2PQohkz9LnOEayJRa6EJABLfYuz9Ij2GGI99uA++1NeC6ROa9BGH2/fcJroHKe4fA36XQXR09Jj9WQ1fKOwleJ2uf44ujnewZkH8R1rV8fDK0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741311745;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y/4aq+eMYnO5loJ4iQMRDJJDIqAqKXKJt5ry6PiqAfI=;
	b=GPICIKXjIkXn2YXVvvUax06s4GQTXreBSyJCWWmrZnsBNk/sxboKR2UfXRWJC7Ad
	GE+O77/ErV4laeHrGl8//YlZrGzTP+moYWvGkEO40LeWtfkpzGzruq/ZC5JZgfMDpsm
	wVwa2RD14OOepGDN6EsbqAy9I6Ydj0BieaF6vqmw=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741311743549912.4128878772729; Thu, 6 Mar 2025 17:42:23 -0800 (PST)
Date: Fri, 07 Mar 2025 12:42:23 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Lee Jones" <lee@kernel.org>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <1956e449623.d918df8f878871.1225076193678131474@mcqueen.au>
In-Reply-To: <20250306233232.GC8350@google.com>
References: <20250306225524.318562-1-craig@mcqueen.au> <20250306233232.GC8350@google.com>
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Fri, 07 Mar 2025 10:32:32 +1100 Lee Jones  wrote
 > On Fri, 07 Mar 2025, Craig McQueen wrote: 
 >  
 > > If the text "default" is written to the LED's sysfs 'trigger' attr, then 
 > > call led_trigger_set_default() to set the LED to its default trigger. 
 >  
 > More info please. 
 >  
 > Please explain why this is useful. 
 >  
 > Under what circumstances would the default trigger not be set? 

Example Scenario:

Device has a row of LEDs on the front, with several LEDs linked to a trigger (in the device tree, eg linux,default-trigger = "battery";). In normal operation, the LEDs are driven by the default trigger.

But, in some unusual scenarios (eg an error condition, or main application starting up or shutting down) the application wants to temporarily take manual control of the LEDs. Eg turn on a FAULT LED and indicate a fault code on several other LEDs.

When the exceptional manual control is finished, the application wants to return all LEDs to their default trigger. With this code change, the application can simply iterate over all LEDs and write "default" to /sys/class/leds/<each-led>/trigger.

In general, we want to make the functionality of led_trigger_set_default() to be accessible to userspace.

-- 
Craig McQueen


