Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4704F199CFD
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2020 19:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgCaRgW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Mar 2020 13:36:22 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35759 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgCaRgW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Mar 2020 13:36:22 -0400
Received: by mail-io1-f66.google.com with SMTP id o3so17045091ioh.2;
        Tue, 31 Mar 2020 10:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=S1V7zL1CGoQIvYCkkD9lC2eCSgJi/Eyw7rWZO9Jllp0=;
        b=XoM6COAcEl2Tk+NXAfq+4vRwYwtZ95VXiTbP5bOgF22+dDJ4u8CjfiE7WtyBWs34mO
         z4qPcy5JkEAf3TQ9cU3B9BORxfqnZHWhLUuRozoxeOpYMTZhlqFOzke/6a4qLdVA5ZfL
         1qIQzoXhcJPEN07k2qLq3aMxGWLVN+osN9o4f212Pn3UQZAgS7IyQE32XDSgp8m8IOgI
         giupYFOQ3WQIluFG45Cp90s69AZYjfJ/wM5Jrf+j7JZbnUSG12TFzJ5EU6On0IWEMEW+
         3NjEU6wgcLr+9XktYzUnqowXePEHmUOamc9Dq6pcCAswqkZgUoYafoeOPDdnNsGv+jp2
         LeDg==
X-Gm-Message-State: ANhLgQ0zxJJY5dteIdghqwVlf/IKR4fgCrBJYufBuP6XUNQNXFH1e4Tq
        fIhNqXajOh+8LgJ1B30AekBFIUE=
X-Google-Smtp-Source: ADFU+vum0qwSAfSDX0Tn0W+7ZEAsCapO6gblBcfWRoyIc7VlLLnpNVNvmILJTzc2kwcHz9K8NJjr3Q==
X-Received: by 2002:a05:6602:199:: with SMTP id m25mr16416621ioo.13.1585676179679;
        Tue, 31 Mar 2020 10:36:19 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o23sm6127111ild.33.2020.03.31.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 10:36:19 -0700 (PDT)
Received: (nullmailer pid 324 invoked by uid 1000);
        Tue, 31 Mar 2020 17:36:17 -0000
Date:   Tue, 31 Mar 2020 11:36:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] leds: pwm: add reference to common leds for
  default-state
Message-ID: <20200331173617.GA32737@bogus>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
 <20200321081321.15614-6-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200321081321.15614-6-Denis.Osterland@diehl.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 21 Mar 2020 08:15:51 +0000, Denis Osterland-Heim wrote:
> 
> The default-state is now supported for PWM leds.
> 
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-pwm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
