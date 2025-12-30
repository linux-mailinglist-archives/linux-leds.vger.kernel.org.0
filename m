Return-Path: <linux-leds+bounces-6491-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D6CE87A5
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 02:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 409F93001C1F
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 01:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5D81EA7CC;
	Tue, 30 Dec 2025 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh/T6IlS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F417B50A;
	Tue, 30 Dec 2025 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767057971; cv=none; b=BXZRWlxsri/PplgpcYrUWjLyJ4mVWRaoK3HnW81EQQqVZyYJprqe2W5yyYH3X3YQAhLi+bP7rvvGg8uexcjfEWRqsp+sqabgM+2ylQZA0/FCbWifOYkrxIi6yFMUvioyWBHAWOR0lfnSnOXuPHpuJSgHLrMU+ZpZ48dw706tloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767057971; c=relaxed/simple;
	bh=CE7nLYnKD16EvX7bU+H74c13F/QssNUvdCvSj8cuGeY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j77gsh0o0r/1pPAWB8exu4ye8I8JAvpH6PtDQ41JOs1B0uklo/kRSFSG+Jt/zHkXasNUDr7sZAU981VqlWs0l+dhVCz08AN2sbW8vrOyAwpQB0zf4oOZpCP0U60+IVM9mqg2vbMEkOSM7363Dhxl7QEtrKAmy/aWx+YQKDEv9jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh/T6IlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09451C4CEF7;
	Tue, 30 Dec 2025 01:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767057971;
	bh=CE7nLYnKD16EvX7bU+H74c13F/QssNUvdCvSj8cuGeY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uh/T6IlSutUcU5fDHTctPDsCdbv4rTJ7Wcw3bwSkRczFQssF4pL6HVNzOL5o3/rRK
	 mLy+XGk3YmAsfA2P8dRZz9htFvCmYk0qLWWO8rV9q9QiwUGNkZdZEg6jUcq3Azy82N
	 VEctyAjinNiuo0F9un27f+vBNCTiwapnvgMOsp3Wblm2a4FTRM4DNi3ltf4lxYrvrV
	 EO4fts1KeCqJd9fMeqgSgHxoJFAYaktaKHljp3xnm27U/CFcUQNPPupTmoSlQWZhI3
	 YdrP8mDANOs8PD7OSv6YbLrxM0Aaz4vACMv48bk3kESIIOTiPu1vXK5sMnWUwr7+xW
	 MQDhyerhf2Low==
Date: Mon, 29 Dec 2025 19:26:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andriy Shevencho <andriy.shevchenko@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Brophy <professor_jonny@hotmail.com>, 
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, devicetree@vger.kernel.org
To: Jonathan Brophy <professorjonny98@gmail.com>
In-Reply-To: <20251230003250.1197744-4-professorjonny98@gmail.com>
References: <20251230003250.1197744-1-professorjonny98@gmail.com>
 <20251230003250.1197744-4-professorjonny98@gmail.com>
Message-Id: <176705797007.3053564.852280537388416393.robh@kernel.org>
Subject: Re: [PATCH v4 3/7] dt-bindings: leds: Add virtual LED group
 controller bindings


On Tue, 30 Dec 2025 13:32:40 +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Add device tree bindings for the virtual LED group controller that
> provides priority-based arbitration for shared physical LEDs across
> multiple virtual LED instances.
> 
> Bindings for the virtual driver are not describing hardware LEDs they
> describe virtual devices made from groups of hardware LEDs created from an array
> of LED phandles.
> 
> Normally the device tree is used to describe hardware not virtual hardware
> but it is particularly useful in situations where you require an LED to be a
> specific color by mixing primary colors, such as multi element multi color LEDs
> to be operated from a device tree binding or a single trigger.
> 
> It also becomes useful with multiple LEDs operating the same indicator such as
> ring of light indicators, led rope where the LEDs are driven From different GPIO
> outputs unifying the control that can give basic indication during system startup,
> shutdown upgrade etc...
> The controller implements winner-takes-all arbitration where only the
> highest-priority active virtual LED controls the hardware at any given
> time. This enables multiple subsystems (boot, error, status indicators)
> to request LED control without explicit coordination.
> 
> Binding supports:
> - Multiple virtual LED children with independent priorities
> - GPIO, PWM, I2C, and SPI physical LED devices
> - Multicolor and standard (fixed-color) operating modes
> - Global ownership tracking to prevent conflicts
> 
> Example configurations include:
> - High-priority emergency/error RGB indicator
> - Medium-priority system state RGBW indicator
> - Low-priority warm white fixed-color indicator
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm-leds): 'led-pwm-blue', 'led-pwm-green', 'led-pwm-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251230003250.1197744-4-professorjonny98@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


