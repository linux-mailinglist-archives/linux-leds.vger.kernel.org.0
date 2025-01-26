Return-Path: <linux-leds+bounces-3850-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDFA1C628
	for <lists+linux-leds@lfdr.de>; Sun, 26 Jan 2025 03:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB3C3A65A2
	for <lists+linux-leds@lfdr.de>; Sun, 26 Jan 2025 02:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FDA25A628;
	Sun, 26 Jan 2025 02:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="KYw6AIfN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B815748F
	for <linux-leds@vger.kernel.org>; Sun, 26 Jan 2025 02:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737858899; cv=none; b=GevV4EAWfZEhQ4DGf6di8e6/woV46lUYW0YaTvAN9mXMGkgq36ZoV61kcrlqHequokaaiVid7hYHSFuym1kdkpmIFwI/mtAUPEWUPnIYXIKXfhgp9deVya2Rw5Kh/WFSCw92lVsUCBiyh9cwSRtfa6Y0/uHF8ASMO6UbaOGt3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737858899; c=relaxed/simple;
	bh=ZHgwIX5Si8EuaO3U+nOA8+8Dkb+oMR24yYvimlEPd7g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLwFh3ZGumLOggEKOF6HrdQTVLYxWjPVpuqPT+Mvtm2iNScYcFjUWdoYbIporsohlZmOmuCDynYLbVLOV5vQqgwJoHOyr6+6OrnJP0KCQZuXv5JAXfXWUciX4wEjFN4FoPxxpL5ha5DyrCgWFsl6C5jMgE5aSIslh3JUpa51f0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=KYw6AIfN; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=u/KblXNZNqECB5Rw5t9pXyzKxzeOY3qWhHAexYM/bCA=; b=KYw6AIfNe9HN2UkU
	gZglZCXzseS55fz4+ojZgS3FbWnXoDNCwLlzpw/Z7ELidWhEfwc9jair958vobnAK/9zdcunvaawL
	ujFn7lWx7QFsn8HPKZUkX3ARc3cqcUpGkn3ztOq/HneH/U61e9zu1vSBZFe8AjCyK6AH/bak9ypsz
	OKPxjDF1MTkf1wmzGolMgc1AJUuyLVesMDy2gJCzrVD55RqoPICZQ8pq+86yBpgqpcRyzzTarRPeI
	pG+dxh8/+ll3v15nObkZyIxRQhU0r56jp/V6mDG2T5yKH8eRqFKNxJWRl8s20d+UmegEaS0FPJNGw
	3Ce0irbKW1XeqYbenQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tbsU5-00C1BG-0X
	for linux-leds@vger.kernel.org;
	Sun, 26 Jan 2025 02:34:49 +0000
Date: Sun, 26 Jan 2025 02:34:49 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: linux-leds@vger.kernel.org
Subject: ledtrig_flash_ctrl and ledtrig_torch_ctrl
Message-ID: <Z5WfSYiANGBXgdW8@gallifrey>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 02:31:12 up 262 days, 13:45,  1 user,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  One of my scripts noticed that ledtrig_flash_ctrl() and
ledtrig_torch_ctrl() don't seem to be called anywhere,
and don't seem to have been since they were added in 2013.

Are they actually deadcode I can/should remove?

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

