Return-Path: <linux-leds+bounces-3915-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157EA2F744
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 19:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EFAC3A66DE
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57840255E24;
	Mon, 10 Feb 2025 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LtX+FpRZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E7192B84
	for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2025 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212631; cv=none; b=oKYIGML+8lD0GvO+wbPLOH5FxrmPs2YwJZbVANBxUfiYUKOFzE/cKF/PlSEd8JXE0O6JUT7Vls5QLGCQELaGXWAmMO6aGJ5Kmu8ignTiPA/J3VkdSY7xlx2KG0zEbkxI32zkePVCxBjGOiL4l81ZY92YHcsoyRdwSnF7+mFxtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212631; c=relaxed/simple;
	bh=GITcloAZazGyr4FvwmIyyFTZLt8zBlUkq3pDY/guiG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahPBTkSOJyODiyaMA5z9LlVuGXMzaVU/c44EI4Yoj+SwOmL9530MMkIuc2EYJ8kR8bjHA+EHxYcokTR6UyMGXdI7FeWx35z4tKWQwX6WisJuQRrijcBOH1aPXSlUjbEvKSVc+ErBg7JgklbsQ7h1/adOEmbNFSY2HJix+PF6UF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LtX+FpRZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=iLOLqU1Xzr1Bb5u4wRV8XNnBBSqfEhWlLamcMZWDYUs=; b=LtX+FpRZHlla1zey
	MotALDCwqBPk5eqpZyx3NmD2OaRzdWrSUdc43r7H9/qwgo4+UxlM84ePtwW4Al1tzkA33QjTcac/Q
	BEQQXQB+C687Ct5XKMeAm8NEz+6qLo9tPnDwqNnOGP8y5MMzpQC/qWw+tSxeQlW4ni1Yb3R3d7cNy
	Xx/dskKcdcdPhGg11naIsgEXmLGrmxfm2VQ+GI9NAMEysXw9oVhYZaVo0dcz9ZyU+ZWN7bX8JSzk1
	UB22McUQqu2Ido+Yg+eXLSwYAWcpfkWRtyPeW7puZrNQ4jXMUPe9kUHpZ2raNq0QRirJ0/hbmJ9He
	nlTANzjg3+QrZJzWyQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1thYeR-00Engr-1E;
	Mon, 10 Feb 2025 18:36:59 +0000
Date: Mon, 10 Feb 2025 18:36:59 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Lee Jones <lee@kernel.org>, pavel@kernel.org, Milo.Kim@ti.com
Cc: linux-leds@vger.kernel.org
Subject: Re: ledtrig_flash_ctrl and ledtrig_torch_ctrl
Message-ID: <Z6pHS6okVYlHUL1V@gallifrey>
References: <Z5WfSYiANGBXgdW8@gallifrey>
 <20250210170949.GG1868108@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210170949.GG1868108@google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:34:44 up 278 days,  5:48,  1 user,  load average: 0.01, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Copying in Milo

* Lee Jones (lee@kernel.org) wrote:
> On Sun, 26 Jan 2025, Dr. David Alan Gilbert wrote:
> 
> > Hi,
> >   One of my scripts noticed that ledtrig_flash_ctrl() and
> > ledtrig_torch_ctrl() don't seem to be called anywhere,
> > and don't seem to have been since they were added in 2013.
> > 
> > Are they actually deadcode I can/should remove?
> 
> I would ping the authors first.  If there are no good reasons to keep
> them around come back, you can remove them.

OK, copied in.

Dave

> -- 
> Lee Jones [李琼斯]
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

